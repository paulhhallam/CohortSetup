# AWS account region for user accounts
variable "region_testing" {
  type    = string
  default = "eu-west-2"
}

# AWS account region for prod account
variable "region_prod" {
  type    = string
  default = "eu-west-2"
}

#
### Group variables - should be a list really
### variable the DEV groups
variable "DEVSG1group" {
  type = string
  default = ""
}
variable "DEVSG2group" {
  type = string
  default = ""
}
variable "DEVSG3group" {
  type = string
  default = ""
}
variable "DEVS-IAMPermgroup" {
  type = string
  default = ""
}
variable "DEVS-S3group" {
  type = string
  default = ""
}
variable "DEVS-Lambdagroup" {
  type = string
  default = ""
}
variable "DEVS-Amplifygroup" {
  type = string
  default = ""
}
variable "DEVS-Adminsgroup" {
  type = string
  default = ""
}
### variable the PSA groups
variable "PSA-Adminsgroup" {
  type = string
  default = ""
}
### variable the SSM_SSH Group
variable "DEVS_SSM_SSHgroup" {
  type = string
  default = ""
}

variable "BillingFullAccess" {
  type = string
  default = ""
}
variable "Allow_user_change_credentials" {
  type = string
  default = ""
}
variable "LimitedAdminAccess" {
  type = string
  default = ""
}
variable "LambdaUserPolicy" {
  type = string
  default = ""
}
variable "LondonOnly" {
  type = string
  default = ""
}
variable "QT-Change-Pwds" {
  type = string
  default = ""
}
variable "FullCostExplorerAccess" {
  type = string
  default = ""
}
variable "IAMListGetPassInstanceRole" {
  type = string
  default = ""
}
variable "DenyChangesToCodeCommitMaster" {
  type = string
  default = ""
}
variable "DevECRPolicy" {
  type = string
  default = ""
}
variable "Devappsync-all" {
  type = string
  default = ""
}
variable "Devcognito-idp-all" {
  type = string
  default = ""
}
variable "TFStateLocking" {
  type = string
  default = ""
}
variable "DevAmplifyExecutionPolicy" {
  type = string
  default = ""
}
variable "Devamplify-fullaccess-global" {
  type = string
  default = ""
}
variable "DevCohortRolePolicy" {
  type = string
  default = ""
}
variable "AmplifyConsoleAccess" {
  type = string
  default = ""
}
#
### Create the SSM_SSH policies
#
variable "SSMUserAdminAccess" {
  type = string
  default = ""
}
variable "SSM_SSH_QuickStart" {
  type = string
  default = ""
}
variable "SSMAccessfromCLI" {
  type = string
  default = ""
}

