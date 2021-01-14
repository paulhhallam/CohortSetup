#
### Policy variables - should be a list really
#output "Allow_user_change_credentials" {
#  value = module.policies.Allow_user_change_credentials
#}
#output "BillingFullAccess" {
#  value = module.policies.BillingFullAccess
#}
#output "LimitedAdminAccess" {
#  value = module.policies.LimitedAdminAccess
#}
#output "LambdaUserPolicy" {
#  value = module.policies.LambdaUserPolicy
#}
#output "LondonOnly" {
#  value = module.policies.LondonOnly
#}
#output "QT-Change-Pwds" {
#  value = module.policies.QT-Change-Pwds
#}
#output "FullCostExplorerAccess" {
#  value = module.policies.FullCostExplorerAccess
#}
#output "IAMListGetPassInstanceRole" {
#  value = module.policies.IAMListGetPassInstanceRole
#}
#output "DenyChangesToCodeCommitMaster" {
#  value = module.policies.DenyChangesToCodeCommitMaster
#}
#output "DevECRPolicy" {
#  value = module.policies.DevECRPolicy
#}
#### Create the SSM_SSH policies
#output "SSMUserAdminAccess" {
#  value = module.policies.SSMUserAdminAccess
#}
#output "SSM_SSH_QuickStart" {
#  value = module.policies.SSM_SSH_QuickStart
#}
#output "SSMAccessfromCLI" {
#  value = module.policies.SSMAccessfromCLI
#}
###
##### Group variables - should be a list really
##### output the DEV groups
#output "DEVSG1group" {
#  value = module.groups.DEVSG1group
#}
#output "DEVSG2group" {
#  value = module.groups.DEVSG2group
#}
#output "DEVS-IAMPermgroup" {
#  value = module.groups.DEVS-IAMPermgroup
#}
#output "DEVS-S3group" {
#  value = module.groups.DEVS-S3group
#}
#output "DEVS-Lambdagroup" {
#  value = module.groups.DEVS-Lambdagroup
#}
#output "DEVS-Adminsgroup" {
#  value = module.groups.DEVS-Adminsgroup
#}
#### output the PSA groups
#output "PSA-Adminsgroup" {
#  value = module.groups.PSA-Adminsgroup
#}
#### output the SSM_SSH Group
#output "DEVS_SSM_SSHgroup" {
#  value = module.groups.DEVS_SSM_SSHgroup
#}
## output default password
output "userids" {
  value = module.users.userids
}
output "passwords" {
  value = module.users.passwords
}
output "puserids" {
  value = module.users.puserids
}
#output "ppasswords" {
#  value = module.users.ppasswords
#}
#output "s3_bucket_arn" {
#  value       = aws_s3_bucket.terraform_state.arn
#  description = "The ARN of the S3 bucket"
#}
#output "dynamodb_table_name" {
#  value       = aws_dynamodb_table.terraform_locks.name
#  description = "The name of the DynamoDB table"
#}

