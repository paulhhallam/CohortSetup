#
### Create the cohort Policies ###
#
output "Allow_user_change_credentials" {
  value = aws_iam_policy.Allow_user_change_credentials.arn
}
output "BillingFullAccess" {
  value = aws_iam_policy.BillingFullAccess.arn
}
output "LimitedAdminAccess" {
  value = aws_iam_policy.LimitedAdminAccess.arn
}
output "LambdaUserPolicy" {
  value = aws_iam_policy.LambdaUserPolicy.arn
}
output "LondonOnly" {
  value = aws_iam_policy.LondonOnly.arn
}
output "QT-Change-Pwds" {
  value = aws_iam_policy.QT-Change-Pwds.arn
}
output "FullCostExplorerAccess" {
  value = aws_iam_policy.FullCostExplorerAccess.arn
}
output "IAMListGetPassInstanceRole" {
  value = aws_iam_policy.IAMListGetPassInstanceRole.arn
}
output "DenyChangesToCodeCommitMaster" {
  value = aws_iam_policy.DenyChangesToCodeCommitMaster.arn
}
output "DevECRPolicy" {
  value = aws_iam_policy.DevECRPolicy.arn
}
output "Devappsync-all" {
  value = aws_iam_policy.appsync-all.arn
}
output "Devcognito-idp-all" {
  value = aws_iam_policy.cognito-idp-all.arn
}
output "TFStateLocking" {
  value = aws_iam_policy.TFStateLocking.arn
}
output "DevAmplifyExecutionPolicy" {
  value = aws_iam_policy.AmplifyExecutionPolicy.arn
}
output "Devamplify-fullaccess-global" {
  value = aws_iam_policy.amplify-fullaccess-global.arn
}
output "DevCohortRolePolicy" {
  value = aws_iam_policy.CohortRolePolicy.arn
}
output "AmplifyConsoleAccess" {
  value = aws_iam_policy.AmplifyConsoleAccess.arn
}
#
### Create the SSM_SSH policies
#
output "SSMUserAdminAccess" {
  value = aws_iam_policy.SSMUserAdminAccess.arn
}
output "SSM_SSH_QuickStart" {
  value = aws_iam_policy.SSM_SSH_QuickStart.arn
}
output "SSMAccessfromCLI" {
  value = aws_iam_policy.SSMAccessfromCLI.arn
}
