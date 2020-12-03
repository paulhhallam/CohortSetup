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

