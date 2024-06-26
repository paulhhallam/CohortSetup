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

variable "iam_cohort_users" {
  description = "List of iam users that that needs to be created"
  type = list(string)
  default = [""]
}

variable "iam_dev_admin_users" {
  description = "List of development iam admin users that that needs to be created"
  type = list(string)
  default = [""]
}

variable "iam_psa_admin_users" {
  description = "List of psa admin users that that needs to be created"
  type = list(string)
  default = [""]
}
