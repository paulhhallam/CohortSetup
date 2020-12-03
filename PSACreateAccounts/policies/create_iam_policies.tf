### Create the cohort Policies ###

resource "aws_iam_policy" "TFStateLocking" {
  name        = "TFStateLocking"
  path        = "/"
  policy = file("${path.module}//json/TFState.json")
}
resource "aws_iam_policy" "Allow_user_change_credentials" {
  name        = "Allow_user_change_credentials"
  path        = "/"
  policy = file("${path.module}//json/credentials.json")
}
resource "aws_iam_policy" "BillingFullAccess" {
  name        = "BillingFullAccess"
  path        = "/"
  policy = file("${path.module}//json/BillingFullAccess.json")
}
resource "aws_iam_policy" "LimitedAdminAccess" {
  name        = "LimitedAdminAccess"
  path        = "/"
  policy = file("${path.module}//json/LimitedAdminAccess.json")
}
resource "aws_iam_policy" "LambdaUserPolicy" {
  name        = "LambdaUserPolicy"
  path        = "/"
  policy = file("${path.module}//json/LambdaUserPolicy.json")
}
resource "aws_iam_policy" "LondonOnly" {
  name        = "LondonOnly"
  path        = "/"
  policy = file("${path.module}//json/LondonOnly.json")
}
resource "aws_iam_policy" "QT-Change-Pwds" {
  name        = "QT-Change-Pwds"
  path        = "/"
  policy = file("${path.module}//json/QT-Change-Pwds.json")
}
resource "aws_iam_policy" "FullCostExplorerAccess" {
  name        = "FullCostExplorerAccess"
  path        = "/"
  policy = file("${path.module}//json/InstanceRole.json")
}
resource "aws_iam_policy" "IAMListGetPassInstanceRole" {
  name        = "IAMListGetPassInstanceRole"
  path        = "/"
  policy = file("${path.module}//json/InstanceRole.json")
}
resource "aws_iam_policy" "DenyChangesToCodeCommitMaster" {
  name        = "DenyChangesToCodeCommitMaster"
  path        = "/"
  policy = file("${path.module}//json/DenyChangesToCodeCommitMaster.json")
}
resource "aws_iam_policy" "DevECRPolicy" {
  name        = "DevECRPolicy"
  path        = "/"
  policy = file("${path.module}//json/DevECRPolicy.json")
}
resource "aws_iam_policy" "AmplifyExecutionPolicy" {
  name        = "AmplifyExecutionPolicy"
  path        = "/"
  policy = file("${path.module}//json/AmplifyExecutionPolicy.json")
}
resource "aws_iam_policy" "amplify-fullaccess-global" {
  name        = "amplify-fullaccess-global"
  path        = "/"
  policy = file("${path.module}//json/amplify-fullaccess-global.json")
}
resource "aws_iam_policy" "CohortRolePolicy" {
  name        = "CohortRolePolicy"
  path        = "/"
  policy = file("${path.module}//json/CohortRolePolicy.json")
}
resource "aws_iam_policy" "appsync-all" {
  name        = "appsync-all"
  path        = "/"
  policy = file("${path.module}//json/appsync-all.json")
}
resource "aws_iam_policy" "cognito-idp-all" {
  name        = "cognito-idp-all"
  path        = "/"
  policy = file("${path.module}//json/cognito-idp-all.json")
}
resource "aws_iam_policy" "AmplifyConsoleAccess" {
  name        = "AmplifyConsoleAccess"
  path        = "/"
  policy = file("${path.module}//json/AmplifyConsoleAccess"
}

### Create the SSM_SSH policies

resource "aws_iam_policy" "SSMUserAdminAccess" {
  name        = "SSMUserAdminAccess"
  path        = "/"
  policy = file("${path.module}//json/SSM.json")
}
resource "aws_iam_policy" "SSM_SSH_QuickStart" {
  name        = "SSM_SSH_QuickStart"
  path        = "/"
  policy = file("${path.module}//json/SSM_SSH_QuickStart.json")
}
resource "aws_iam_policy" "SSMAccessfromCLI" {
  name        = "SSMAccessfromCLI"
  path        = "/"
  policy = file("${path.module}//json/SSMAccessfromCLI.json")
}

### Create PHH testing policies

resource "aws_iam_policy" "PHH_SSM_SSH" {
  name        = "PHH_SSM_SSH"
  path        = "/"
  policy = file("${path.module}//json/PHH_SSM_SSH.json")
}
resource "aws_iam_policy" "PHH-SSM2" {
  name        = "PHH-SSM2"
  path        = "/"
  policy = file("${path.module}//json/PHH-SSM2.json")
}
resource "aws_iam_policy" "PHH-AMAZON-SSM" {
  name        = "PHH-AMAZON-SSM"
  path        = "/"
  policy = file("${path.module}//json/PHH-AMAZON-SSM.json")
}
