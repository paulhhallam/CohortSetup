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
variable "DevAmplifyExecutionPolicy" {
  type = string
  default = ""
}
variable "DevCohortRolePolicy" {
  type = string
  default = ""
}

