variable "Allow_user_change_credentials" {
  type = string
  default = ""
}
variable "BillingFullAccess" {
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
variable "DevAmplifyExecutionPolicy" {
  type = string 
  default = ""
}
variable "Devamplify-fullaccess-global" {
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

