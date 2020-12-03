#
# Configure terraform to use the state locking
#
terraform {
  backend "s3" {
    bucket         = "psa-cohort-state-files"
    key            = "PSA_state_files/cohort/InstanceScheduler/tfstate"
    region         = "eu-west-2"
    dynamodb_table = "PSA_State_Locks"
    encrypt        = true
  }
}


# Add the instance scheduler role to allow the Organisation account to run schedules
#
module "instanceschedulerSub" {
  source = "./instanceschedulerSub/"
  OrgAccountId = var.OrgAccountId
}

