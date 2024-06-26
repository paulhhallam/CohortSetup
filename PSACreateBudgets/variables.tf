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

variable "monthly_budget_alert_email_list" {
  type    = list(string)
  default = [""]
}
variable "daily_budget_alert_list" {
  type    = list(string)
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
  type    = list(string)
  default = [""]
}
variable "iam_dev_admin_users" {
  type    = list(string)
  default = [""]
}
variable "iam_psa_admin_users" {
  type    = list(string)
  default = [""]
}

#variable "BATopicARN" {
#  type = string
#  default = ""
#}
#variable "BDTopicARN" {
#  type = string
#  default = ""
#}
#
# from https://github.com/zghafari/tf-sns-email-list/blob/master/variables.tf
#
variable "BAdisplay_name" {
  type        = string
  description = "Name shown in Account budget confirmation emails"
  default = "Account Budget Information"
}

variable "BDdisplay_name" {
  type        = string
  description = "Name shown in Daily budget confirmation emails"
  default = "Daily Budget Information"
}

variable "protocol" {
  default     = "email"
  description = "SNS Protocol to use. email or email-json"
  type        = string
}

variable "BAstack_name" {
  type        = string
  description = "Unique Account budget Cloudformation stack name that wraps the SNS topic."
  default = "AccountBudgetStack"
}

variable "BDstack_name" {
  type        = string
  description = "Unique Daily budget Cloudformation stack name that wraps the SNS topic."
  default = "DailyBudgetStack"
}

