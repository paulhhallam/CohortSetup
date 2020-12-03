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

variable "BAemail_addresses" {
  type        = list(string)
  description = "Email address to send Account budget notifications to"
}

variable "BDemail_addresses" {
  type        = list(string)
  description = "Email address to send Daily budget notifications to"
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

