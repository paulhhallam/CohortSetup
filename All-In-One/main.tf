#
# Create the account policies
#
module "policies" {
  source = "../Accounts/policies/"
  BillingFullAccess = var.TBillingFullAccess
}

#
# Create the account groups
#
module "groups" {
  source = "../Accounts/groups/"
  DEVSgroup = "${var.TDEVSgroup}"
}

#
# Attach the policies to the relevant group
#
module "policies_to_groups" {
  source = "../Accounts/policies_to_groups/"

  DEVSgroup         = module.groups.DEVSgroup
  DEVSP2group       = module.groups.DEVSP2group
  DEVS-IAMPermgroup = module.groups.DEVS-IAMPermgroup
  DEVS-S3group      = module.groups.DEVS-S3group
  DEVS-Lambdagroup  = module.groups.DEVS-Lambdagroup
  DEVS-Adminsgroup  = module.groups.DEVS-Adminsgroup
  PSA-Adminsgroup   = module.groups.PSA-Adminsgroup

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
}

#
# Create the users and attach the relevant groups
#
module "users" {
  source = "../Accounts/users/"
  iam_cohort_users = "${var.iam_cohort_users}" 
  iam_admin_users = "${var.iam_admin_users}"
  DEVSgroup         = module.groups.DEVSgroup
  DEVSP2group       = module.groups.DEVSP2group
  DEVS-IAMPermgroup = module.groups.DEVS-IAMPermgroup
  DEVS-S3group      = module.groups.DEVS-S3group
  DEVS-Lambdagroup  = module.groups.DEVS-Lambdagroup
  DEVS-Adminsgroup  = module.groups.DEVS-Adminsgroup
  PSA-Adminsgroup   = module.groups.PSA-Adminsgroup

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
}
#
# Create the autotag function
#
module "autotag" {
  source = "../InstanceMgmt/autotag/"
}

#
# Add the instance scheduler role to allow the Organisation account to run schedules
#
module "instanceschedulerSub" {
  source = "../InstanceMgmt/instanceschedulerSub/"
}
#
# Add the instance scheduler role to allow the Organisation account to run schedules
#
module "instanceschedulerOrg" {
  source = "../OrganisationInstanceScheduler/instanceschedulerOrg/"
#  OrgSchedule = ""
}

