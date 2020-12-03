###            "RoleName": "PHH-SSM2",
###            "RoleName": "PHH_SSM_ROLE",
###            "RoleName": "PSARoleRuleUsernameMissing",
###            "RoleName": "SNSFailureFeedback",
###            "RoleName": "SNSSuccessFeedback",

### From other sessions
###            "RoleName": "DailyBudget",
###            "RoleName": "DailyBudgetSlack",
###            "RoleName": "ecsTaskExecutionRole",
###            "RoleName": "AutoTagEC2RDS-EC2LambdaAutoTagRole-1TWF35E5XQL4",
###            "RoleName": "AutoTagEC2RDS-RDSLambdaAutoTagRole-1KOQNMUV79N0P",
###            "RoleName": "InstanceScheduler-EC2SchedulerCrossAccountRole-1MY8VUG8UCB4D",
###            "RoleName": "slack-budget-bdphh-LambdaFunctionRole-1HD4906IXUY8K",

###
### PHH-SSM2
###

resource "aws_iam_role_policy" "PHH-SSM2v2" {
  name = "PHH-SSM2v2"
  role = aws_iam_role.PHH-SSM2v2.id
  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "ssm:DescribeDocument",
          "ec2messages:GetEndpoint",
          "ec2messages:GetMessages",
          "ssmmessages:OpenControlChannel",
          "ssm:PutConfigurePackageResult",
          "ssm:ListInstanceAssociations",
          "ssm:GetParameter",
          "ssm:UpdateAssociationStatus",
          "ssm:GetManifest",
          "ec2messages:DeleteMessage",
          "ssm:UpdateInstanceInformation",
          "ec2messages:FailMessage",
          "ssmmessages:OpenDataChannel",
          "ssm:GetDocument",
          "ssm:PutComplianceItems",
          "ssm:DescribeAssociation",
          "ssm:GetDeployablePatchSnapshotForInstance",
          "ec2messages:AcknowledgeMessage",
          "ssm:GetParameters",
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssm:PutInventory",
          "ec2messages:SendReply",
          "ssm:ListAssociations",
          "ssm:UpdateInstanceAssociationStatus"
        ],
        "Resource": "*"
      }
    ]
  }
  EOF
}
resource "aws_iam_role" "PHH-SSM2v2" {
  name = "PHH-SSM2v2"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF
}
resource "aws_iam_role_policy_attachment" "PHH-SSM2v2" {
  role       = aws_iam_role.PHH-SSM2v2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

###
### AmazonSSMRoleForInstancesQuickSetup
###

resource "aws_iam_role" "AmazonSSMRoleForInstancesQuickSetupV2" {
  name = "AmazonSSMRoleForInstancesQuickSetupV2"
  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  }
  EOF
}
resource "aws_iam_role_policy_attachment" "AmazonSSMRoleForInstancesQuickSetupV2" {
  role       = aws_iam_role.AmazonSSMRoleForInstancesQuickSetupV2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

###
### AmazonSSMRoleForAutomationAssumeQuickSetup
###

resource "aws_iam_role_policy" "SsmOnboardingInlinePolicy" {
  name = "SsmOnboardingInlinePolicy"
  role = aws_iam_role.AmazonSSMRoleForAutomationAssumeQuickSetupV2.id
  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
         "Effect": "Allow",
         "Action": [
           "iam:CreateInstanceProfile",
           "iam:ListInstanceProfilesForRole",
           "iam:PassRole",
           "ec2:DescribeIamInstanceProfileAssociations",
           "iam:GetInstanceProfile",
           "ec2:DisassociateIamInstanceProfile",
           "ec2:AssociateIamInstanceProfile",
           "iam:AddRoleToInstanceProfile"
         ],
         "Resource": "*"
      }
    ]
  }
  EOF
}
#resource "aws_iam_role_policy" "SSMQuickSetupEnableExplorerInlinePolicy" {
#  name = "SSMQuickSetupEnableExplorerInlinePolicy"
#  role = aws_iam_role.AmazonSSMRoleForAutomationAssumeQuickSetupV2.id
#  policy = <<-EOF
#  {
#    "Version": "2012-10-17",
#    "Statement": [
#      {
#        "Effect": "Allow",
#        "Action": [
#          "iam:ListRoles",
#          "config:DescribeConfigurationRecorders",
#          "compute-optimizer:GetEnrollmentStatus",
#          "support:DescribeTrustedAdvisorChecks"
#        ],
#        "Resource": "*"
#      },
#      {
#        "Effect": "Allow",
#        "Action": [
#          "ssm:UpdateServiceSetting",
#          "ssm:GetServiceSetting"
#        ],
#        "Resource": [
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsitem/ssm-patchmanager",
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsitem/EC2",
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsdata/ExplorerOnboarded",
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsdata/Association",
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsdata/OpsData-TrustedAdvisor",
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsdata/ComputeOptimizer",
#          "arn:aws:ssm:*:*:servicesetting/ssm/opsdata/SupportCenterCase"
#        ]
#      },
#      {
#        "Effect": "Allow",
#        "Action": [
#          "iam:CreateServiceLinkedRole"
#        ],
#        "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM"
#      }
#    ]
#  }
#  EOF
#}
resource "aws_iam_role" "AmazonSSMRoleForAutomationAssumeQuickSetupV2" {
  name = "AmazonSSMRoleForAutomationAssumeQuickSetupV2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ssm.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags = {
    "owner" = "psa"
    "app" = "createcohort"
  }
}

###
###Cohorts
###

resource "aws_iam_role_policy" "CohortsV2" {
  name = "CohortsV2"
  role = aws_iam_role.CohortsV2.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "ec2:Describe*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}
resource "aws_iam_role" "CohortsV2" {
  name = "CohortsV2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::940700818461:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    },
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::270848561385:user/PHH"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF
  tags = {
    "owner" = "psa"
    "app" = "createcohort"
  }
}

resource "aws_iam_role_policy_attachment" "CohortsV2" {
  role       = aws_iam_role.CohortsV2.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

