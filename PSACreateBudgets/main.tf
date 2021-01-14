#
# Configure terraform to use the state locking
#
terraform {
  backend "s3" {
#    bucket         = "psa-cohort-state-files"
    key            = "PSA_state_files/cohort/budgets/tfstate"
    region         = "eu-west-2"
    dynamodb_table = "PSA_State_Locks"
    encrypt        = true
  }
}

data "template_file" "BAcloudformation_sns_stack" {
# template = file("${path.module}/templates/email-sns-stack.json.tpl")
  template = file("email-sns-stack.json.tpl")
  vars = {
    display_name = join(" ",[var.cohort_id,var.BAdisplay_name])
    subscriptions = join(
      ",",
      formatlist(
        "{ \"Endpoint\": \"%s\", \"Protocol\": \"%s\"  }",
        var.monthly_budget_alert_email_list,
        var.protocol,
      ),
    )
  }
}

data "template_file" "BDcloudformation_sns_stack" {
# template = file("${path.module}/templates/email-sns-stack.json.tpl")
  template = file("email-sns-stack.json.tpl")
  vars = {
    display_name = join(" ",[var.cohort_id,var.BDdisplay_name])
    subscriptions = join(
      ",",
      formatlist(
        "{ \"Endpoint\": \"%s\", \"Protocol\": \"%s\"  }",
        var.daily_budget_alert_list,
        var.protocol,
      ),
    )
  }
}

resource "aws_cloudformation_stack" "BAsns_topic" {
  name          = var.BAstack_name
  template_body = data.template_file.BAcloudformation_sns_stack.rendered
  tags = {
          owner = "psa"
          app = "BudgetAlerts"
         }
#  tags = merge(
#    {
#      "Name" = var.BAstack_name
#    },
#  )
}

resource "aws_cloudformation_stack" "BDsns_topic" {
  name          = var.BDstack_name
  template_body = data.template_file.BDcloudformation_sns_stack.rendered
  tags = {
          owner = "psa"
          app = "BudgetAlerts"
         }
#  tags = merge(
#    {
#      "Name" = var.BDstack_name
#    },
#  )
}

resource "aws_budgets_budget" "Account" {
  name              = "budget-monthly"
  budget_type       = "COST"
  limit_amount      = "100.0"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2020-07-01_00:00"
  time_unit         = "MONTHLY"
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["paul.hh@tutanota.com"]
#   subscriber_sns_topic_arns  = ["${aws_cloudformation_stack.BAsns_topic.outputs["ARN"]}"]
  }
}

#
# CREATE THE IAM RESOURCES NEEDED FOR THE DAILY BUDGET
#
resource "aws_iam_policy" "DailyBudget" {
  name     = "DailyBudget"
  policy   = file("Policies_required_to_run_the_Lambda_Billing.json")
}

resource "aws_iam_role" "DailyBudget" {
  name               = "DailyBudget"
  assume_role_policy = file("Lambda_Role_trust_policy.json")
  tags = {
          owner = "psa"
          app = "BudgetAlerts"
         }
}

resource "aws_iam_role_policy_attachment" "DailyBudgetPolicy1" {
  role         = aws_iam_role.DailyBudget.name
  policy_arn   = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "DailyBudgetPolicy2" {
  role       = aws_iam_role.DailyBudget.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
}

resource "aws_iam_role_policy_attachment" "DailyBudgetPolicy3" {
  role       = aws_iam_role.DailyBudget.name
  policy_arn = aws_iam_policy.DailyBudget.arn
}

#
# CREATE THE LAMBDA FUNCTION
# N.B. You must have first created the zip file DailyBudget_Lambda_function.zip
#
resource "aws_lambda_function" "DailyBudget" {
  filename         = "DailyBudget_Lambda_function.zip"
  function_name    = "DailyBudget"
  role             = aws_iam_role.DailyBudget.arn
  handler          = "billing_function.billing_handler"
  source_code_hash = filebase64sha256("DailyBudget_Lambda_function.zip")
  runtime = "python3.8"
  environment {
    variables = {
      Dollars = "10",
      SNSARN  = "${aws_cloudformation_stack.BDsns_topic.outputs["ARN"]}"
    }
  }
  tags = {
          owner = "psa"
          app = "BudgetAlerts"
         }
}

#
# CREATE THE EVENTBRIDGE RULE
#
# aws events put-rule --name DailyBudget --schedule-expression 'cron(10 8 * * ? *)'
resource "aws_cloudwatch_event_rule" "DailyBudget" {
  name                = "DailyBudget"
  schedule_expression = "cron(10 8 * * ? *)"
  tags = {
          owner = "psa"
          app = "BudgetAlerts"
         }
}

# aws events put-targets --rule DailyBudget --targets "Id"="1","Arn"="arn:aws:lambda:$REGION:$ARN:function:DailyBudget"
resource "aws_cloudwatch_event_target" "DailyBudget" {
  target_id = "DailyBudget"
  rule      = aws_cloudwatch_event_rule.DailyBudget.name
  arn       = aws_lambda_function.DailyBudget.arn
}
#
# ADD THE PERMISSIONS TO THE LAMBDA FUNCTION
#
#aws lambda add-permission --function-name DailyBudget \
#  --statement-id DailyBudget --action 'lambda:InvokeFunction' --principal events.amazonaws.com \
#    --source-arn arn:aws:events::$ARN:rule/DailyBudget
resource "aws_lambda_permission" "DailyBudget" {
#  statement_id    = DailyBudget 
  function_name   = aws_lambda_function.DailyBudget.function_name
  action          = "lambda:InvokeFunction"
  principal       = "events.amazonaws.com"
  source_arn      = aws_cloudwatch_event_rule.DailyBudget.arn
}

