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

# AWS account / Cohort details
variable "cohort_id" {
  type    = string
  default = ""
}

variable "OrgAccountId" {
  type    = string
  default = ""
}
variable "monthly_budget_alert_email_list" {
  type = list(string)
  default = [""]
}
variable "daily_budget_alert_list" {
  type = list(string)
  default = [""]
}
variable "slack_default_channel_name" {
  type    = string
  default = ""
}
variable "slack_cohort_channel_name" {
  type    = string
  default = ""
}
variable "iam_cohort_users" {
  type = list(string)
  default = [""]
}
variable "iam_dev_admin_users" {
  type = list(string)
  default = [""]
}
variable "iam_psa_admin_users" {
  type = list(string)
  default = [""]
}
