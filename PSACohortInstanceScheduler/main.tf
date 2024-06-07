#
# Configure terraform to use the state locking
#
terraform {
  backend "s3" {
    key            = "P_state_files/cohort/InstanceScheduler/tfstate"
    region         = "eu-west-2"
    dynamodb_table = "P_State_Locks"
    encrypt        = true
  }
}


# Add the instance scheduler role to allow the Organisation account to run schedules
#
module "instanceschedulerSub" {
  source = "./instanceschedulerSub/"
  OrgAccountId = var.OrgAccountId
}

