# AWS account region for user accounts
variable "region_dev" {
  type    = string
  default = "eu-west-2"
}

# AWS account region for prod account
variable "region_prod" {
  type    = string
  default = "eu-west-2"
}

# AWS Organisation owner account ID
variable "OrgAccountId" {
  type = string
  default = ""
}

# AWS Account / Cohort details
variable "cohort_id" {
  type    = string
  default = ""
}

#
### Policy variables - should be a list really
#
variable "TAllow_user_change_credentials" {
  type = string
  default = ""
}
variable "TBillingFullAccess" {
  type = string
  default = ""
}
variable "TLimitedAdminAccess" {
  type = string
  default = ""
}
variable "TLambdaUserPolicy" {
  type = string
  default = ""
}
variable "TAmplifyUserPolicy" {
  type = string
  default = ""
}
variable "TLondonOnly" {
  type = string
  default = ""
}
variable "TQT-Change-Pwds" {
  type = string
  default = ""
}
variable "TFullCostExplorerAccess" {
  type = string
  default = ""
}
variable "TIAMListGetPassInstanceRole" {
  type = string
  default = ""
}
variable "TDenyChangesToCodeCommitMaster" {
  type = string
  default = ""
}
variable "TDevECRPolicy" {
  type = string
  default = ""
}
#
### SSM_SSH policy variables
#
variable "TSSMUserAdminAccess" {
  type = string
  default = ""
}
variable "TSSM_SSH_QuickStart" {
  type = string
  default = ""
}
variable "TSSMAccessfromCLI" {
  type = string
  default = ""
}
#
### Group variables - should be a list really
#
### DEV group variables
#
variable "TDEVSG1group" {
  type = string
  default = ""
}
variable "TDEVSG2group" {
  type = string
  default = ""
}
variable "TDEVS-IAMPermgroup" {
  type = string
  default = ""
}
variable "TDEVS-S3group" {
  type = string
  default = ""
}
variable "TDEVS-Lambdagroup" {
  type = string
  default = ""
}
variable "TDEVS-Amplifygroup" {
  type = string
  default = ""
}
variable "TDEVS-Adminsgroup" {
  type = string
  default = ""
}
#
### PSA group variables
#
variable "TPSA-Adminsgroup" {
  type = string
  default = ""
}
#
### SSM_SSH group variables
#
variable "TDEVS_SSM_SSHgroup" {
  type = string
  default = ""
}
#
### User variables
#
variable "iam_cohort_users" {
  description = "List of iam users that that needs to be created"
  type = list(string)
  default = [""]
}

variable "iam_dev_admin_users" {
  description = "List of development admin users that that needs to be created"
  type = list(string)
  default = [""]
}

variable "iam_psa_admin_users" {
  description = "List of psa admin users that that needs to be created"
  type = list(string)
  default = [""]
}
