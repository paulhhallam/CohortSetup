#
# Configure terraform to use the state locking
#
terraform {
  backend "s3" {
#   bucket         = "vs-appmigration-p-cohort-state-files"
    key            = "p_state_files/cohort/accounts/tfstate"
    region         = "eu-west-2"
    dynamodb_table = "p_State_Locks"
    encrypt        = true
  }
}

#
# Set the account password policy
#
resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

#
# Create the account policies
#
module "policies" {
  source = "./policies/"
  BillingFullAccess = var.TBillingFullAccess
}

#
# Create the account groups
#
module "groups" {
  source = "./groups/"
  DEVSG1group = var.TDEVSG1group
}

#
# Create the account roles
#
module "roles" {
  source = "./roles/"
}

#
# Attach the policies to the relevant group
#
module "policies_to_groups" {
  source = "./policies_to_groups/"

  DEVSG1group       = module.groups.DEVSG1group
  DEVSG2group       = module.groups.DEVSG2group
  DEVSG3group       = module.groups.DEVSG3group
  DEVS-IAMPermgroup = module.groups.DEVS-IAMPermgroup
  DEVS-S3group      = module.groups.DEVS-S3group
  DEVS-Lambdagroup  = module.groups.DEVS-Lambdagroup
  DEVS-Amplifygroup = module.groups.DEVS-Amplifygroup
  DEVS-Adminsgroup  = module.groups.DEVS-Adminsgroup
  p-Adminsgroup   = module.groups.p-Adminsgroup
  DEVS_SSM_SSHgroup = module.groups.DEVS_SSM_SSHgroup

  Allow_user_change_credentials = module.policies.Allow_user_change_credentials
  BillingFullAccess             = module.policies.BillingFullAccess
  LimitedAdminAccess            = module.policies.LimitedAdminAccess
  LambdaUserPolicy              = module.policies.LambdaUserPolicy
  LondonOnly                    = module.policies.LondonOnly
  QT-Change-Pwds                = module.policies.QT-Change-Pwds
  FullCostExplorerAccess        = module.policies.FullCostExplorerAccess
  IAMListGetPassInstanceRole    = module.policies.IAMListGetPassInstanceRole
  DenyChangesToCodeCommitMaster = module.policies.DenyChangesToCodeCommitMaster
  DevECRPolicy                  = module.policies.DevECRPolicy
  SSMUserAdminAccess            = module.policies.SSMUserAdminAccess
  SSM_SSH_QuickStart            = module.policies.SSM_SSH_QuickStart
  SSMAccessfromCLI              = module.policies.SSMAccessfromCLI
  Devappsync-all                = module.policies.Devappsync-all
  Devcognito-idp-all            = module.policies.Devcognito-idp-all
  TFStateLocking                = module.policies.TFStateLocking
  DevAmplifyExecutionPolicy     = module.policies.DevAmplifyExecutionPolicy
  Devamplify-fullaccess-global  = module.policies.Devamplify-fullaccess-global
  DevCohortRolePolicy           = module.policies.DevCohortRolePolicy
  AmplifyConsoleAccess          = module.policies.AmplifyConsoleAccess
}

#
# Create the users and attach the relevant groups
#
module "users" {
  source = "./users/"
  iam_cohort_users    = var.iam_cohort_users 
  iam_dev_admin_users = var.iam_dev_admin_users
  iam_p_admin_users = var.iam_p_admin_users
  DEVSG1group         = module.groups.DEVSG1group
  DEVSG2group         = module.groups.DEVSG2group
  DEVSG3group         = module.groups.DEVSG3group
  DEVS-IAMPermgroup   = module.groups.DEVS-IAMPermgroup
  DEVS-S3group        = module.groups.DEVS-S3group
  DEVS-Lambdagroup    = module.groups.DEVS-Lambdagroup
  DEVS-Amplifygroup   = module.groups.DEVS-Amplifygroup
  DEVS-Adminsgroup    = module.groups.DEVS-Adminsgroup
  p-Adminsgroup     = module.groups.p-Adminsgroup
  DEVS_SSM_SSHgroup   = module.groups.DEVS_SSM_SSHgroup

  Allow_user_change_credentials = module.policies.Allow_user_change_credentials
  BillingFullAccess             = module.policies.BillingFullAccess
  LimitedAdminAccess            = module.policies.LimitedAdminAccess
  LambdaUserPolicy              = module.policies.LambdaUserPolicy
  DevAmplifyExecutionPolicy     = module.policies.DevAmplifyExecutionPolicy
  Devamplify-fullaccess-global  = module.policies.Devamplify-fullaccess-global
  LondonOnly                    = module.policies.LondonOnly
  QT-Change-Pwds                = module.policies.QT-Change-Pwds
  FullCostExplorerAccess        = module.policies.FullCostExplorerAccess
  IAMListGetPassInstanceRole    = module.policies.IAMListGetPassInstanceRole
  DenyChangesToCodeCommitMaster = module.policies.DenyChangesToCodeCommitMaster
  DevECRPolicy                  = module.policies.DevECRPolicy
  SSMUserAdminAccess            = module.policies.SSMUserAdminAccess
  SSM_SSH_QuickStart            = module.policies.SSM_SSH_QuickStart
  SSMAccessfromCLI              = module.policies.SSMAccessfromCLI
}

