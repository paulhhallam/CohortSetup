###
### Attach the DEV group 1 policies 
###
resource "aws_iam_group_policy_attachment" "BillingFullAccess" {
  group      = var.DEVSG1group
  policy_arn = var.BillingFullAccess
}
resource "aws_iam_group_policy_attachment" "FullCostExplorerAccess" {
  group      = var.DEVSG1group
  policy_arn = var.FullCostExplorerAccess
}
resource "aws_iam_group_policy_attachment" "IAMListGetPassInstanceRole" {
  group      = var.DEVSG1group  
  policy_arn = var.IAMListGetPassInstanceRole
}
resource "aws_iam_group_policy_attachment" "AmazonEC2FullAccess" {
  group      = var.DEVSG1group  
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
resource "aws_iam_group_policy_attachment" "AWSCodeCommitPowerUser" {
  group      = var.DEVSG1group  
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitPowerUser"
}
resource "aws_iam_group_policy_attachment" "AWSCloudFormationFullAccess" {
  group      =  var.DEVSG1group  
  policy_arn = "arn:aws:iam::aws:policy/AWSCloudFormationFullAccess"
}
resource "aws_iam_group_policy_attachment" "AmazonCognitoPowerUser" {
  group      =  var.DEVSG1group
  policy_arn = "arn:aws:iam::aws:policy/AmazonCognitoPowerUser"
}
resource "aws_iam_group_policy_attachment" "AmazonSNSFullAccess" {
  group      =  var.DEVSG1group
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}
###
### Attach the Dev Admins policies
###
resource "aws_iam_group_policy_attachment" "AdministratorAccess" {
  group      = var.DEVS-Adminsgroup
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_group_policy_attachment" "AWSCloud9Administrator" {
  group      = var.DEVS-Adminsgroup
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9Administrator"
}
resource "aws_iam_group_policy_attachment" "SSMUserAdminAccess" {
  group      = var.DEVS-Adminsgroup
  policy_arn = var.SSMUserAdminAccess
}
resource "aws_iam_group_policy_attachment" "PSAAdminsSSMUserAdminAccess" {
  group      = var.DEVS-Adminsgroup
  policy_arn = var.SSMUserAdminAccess
}
###
### Attach the IAM Permissions policies
###
resource "aws_iam_group_policy_attachment" "Allow_user_change_credentials" {
  group      = var.DEVS-IAMPermgroup
  policy_arn = var.Allow_user_change_credentials
}
resource "aws_iam_group_policy_attachment" "LimitedAdminAccess" {
  group      = var.DEVS-IAMPermgroup
  policy_arn = var.LimitedAdminAccess
}
resource "aws_iam_group_policy_attachment" "LondonOnly" {
  group      = var.DEVS-IAMPermgroup
  policy_arn = var.LondonOnly
}
resource "aws_iam_group_policy_attachment" "QT-Change-Pwds" {
  group      = var.DEVS-IAMPermgroup
  policy_arn = var.QT-Change-Pwds
}
###
### Attach the Lambda Permissions policies
###
resource "aws_iam_group_policy_attachment" "AWSLambdaFullAccess" {
  group      = var.DEVS-Lambdagroup
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
}
resource "aws_iam_group_policy_attachment" "LambdaUserPolicy" {
  group      = var.DEVS-Lambdagroup
  policy_arn = var.LambdaUserPolicy
}
###
### Attach the S3 permission policies
###
resource "aws_iam_group_policy_attachment" "AmazonS3FullAccess" {
  group      = var.DEVS-S3group
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
###
### Attach the Amplify permission policies
###
resource "aws_iam_group_policy_attachment" "AmplifyExecutionPolicy" {
  group      = var.DEVS-Amplifygroup
  policy_arn = var.DevAmplifyExecutionPolicy
}
resource "aws_iam_group_policy_attachment" "amplify-fullaccess-global" {
  group      = var.DEVS-Amplifygroup
  policy_arn = var.Devamplify-fullaccess-global
}
###
### Attach the Devs group 2 policies
###
resource "aws_iam_group_policy_attachment" "DevECRPolicy" {
  group      = var.DEVSG2group
  policy_arn = var.DevECRPolicy
}
resource "aws_iam_group_policy_attachment" "CohortRolePolicy" {
  group      = var.DEVSG2group
  policy_arn = var.DevCohortRolePolicy
}
resource "aws_iam_group_policy_attachment" "AWSCloud9User" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9User"
}
resource "aws_iam_group_policy_attachment" "AWSCloud9EnvironmentMember" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9EnvironmentMember"
}
resource "aws_iam_group_policy_attachment" "AWSCodePipeline_FullAccess" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
}
resource "aws_iam_group_policy_attachment" "AWSCodeBuildDeveloperAccess" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}
resource "aws_iam_group_policy_attachment" "AWSCodePipelineApproverAccess" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AWSCodePipelineApproverAccess"
}
resource "aws_iam_group_policy_attachment" "AWSCodeBuildAdminAccess" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
}
resource "aws_iam_group_policy_attachment" "AmazonAPIGatewayAdministrator" {
  group      = var.DEVSG2group
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}
###
### Attach the Devs group 3 policies
###
resource "aws_iam_group_policy_attachment" "appsync-all" {
  group      = var.DEVSG3group
  policy_arn = var.Devappsync-all
}
resource "aws_iam_group_policy_attachment" "Devcognito-idp-all" {
  group      = var.DEVSG3group
  policy_arn = var.Devcognito-idp-all
}
resource "aws_iam_group_policy_attachment" "TFStateLocking" {
  group      = var.DEVSG3group
  policy_arn = var.TFStateLocking
}
resource "aws_iam_group_policy_attachment" "AmplifyConsoleAccess" {
  group      = var.DEVSG3group
  policy_arn = var.AmplifyConsoleAccess
}
###
### Attach the PSA ADMINS group policies
###
resource "aws_iam_group_policy_attachment" "PSAAdminsAdministratorAccess" {
  group      = var.PSA-Adminsgroup
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
resource "aws_iam_group_policy_attachment" "PSAAdminsBillingFullAccess" {
  group      = var.PSA-Adminsgroup
  policy_arn = var.BillingFullAccess
}
resource "aws_iam_group_policy_attachment" "PSAAdminsFullCostExplorerAccess" {
  group      = var.PSA-Adminsgroup
  policy_arn = var.FullCostExplorerAccess
}
###
### DEVS_SSM_SSH
###
resource "aws_iam_group_policy_attachment" "AmazonSSMManagedInstanceCore" {
  group      = var.DEVS_SSM_SSHgroup
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
resource "aws_iam_group_policy_attachment" "AmazonSSMFullAccess" {
  group      = var.DEVS_SSM_SSHgroup
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}
resource "aws_iam_group_policy_attachment" "PSAAdminsSSM_SSH_QuickStart" {
  group      = var.DEVS_SSM_SSHgroup
  policy_arn = var.SSM_SSH_QuickStart
}
resource "aws_iam_group_policy_attachment" "SSMAccessfromCLI" {
  group      = var.DEVS_SSM_SSHgroup
  policy_arn = var.SSMAccessfromCLI
}
resource "aws_iam_group_policy_attachment" "AWSCloud9SSMInstanceProfile" {
  group      = var.DEVS_SSM_SSHgroup
  policy_arn = "arn:aws:iam::aws:policy/AWSCloud9SSMInstanceProfile"
}

