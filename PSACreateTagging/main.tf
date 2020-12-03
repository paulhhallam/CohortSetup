#
# Configure terraform to use the state locking
#
terraform {
  backend "s3" {
    bucket         = "psa-cohort-state-files"
    key            = "PSA_state_files/cohort/autotag/tfstate"
    region         = "eu-west-2"
    dynamodb_table = "PSA_State_Locks"
    encrypt        = true
  }
}

#
# Create the autotag function
#
module "autotag" {
  source = "./autotag/"
}

