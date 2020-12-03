#
# https://stackoverflow.com/questions/43266506/is-it-possible-to-execute-a-cloudformation-file-in-terraform/43267465
# https://www.nvisia.com/insights/terraform-template-for-aws-cloudformation-daily-testing
#
resource "aws_cloudformation_stack" "autotag" {
  name = "psa-autotagec2rds"
  template_body = file("${path.module}/AutoTagEC2RDS.template")
  capabilities = ["CAPABILITY_IAM"]
  tags = {
          owner = "psa"
          app = "autotag"
         }
}

