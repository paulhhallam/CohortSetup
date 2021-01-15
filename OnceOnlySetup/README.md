To configure the terraform state locking using S3 
This should be run before any other cohort terraform setup.

1)      Set the required variables in ../accountdetails.tfvars
	An example file is available as "../default_accountdetails.tfvars"

	The unique cohort_id value must be defined in this file and it must be a unique name as it is used for an S3 bucket name.

This file will:

A) Create an S3 bucket with versioning and encryption enabled called psa-cohort-state-file

B) Create a dynamodb table called PSA_State_Locks to hold the Terraform lock id.

******************************************************************
******************************************************************
**  IMPORTANT - remember to add the -var-file when running apply
******************************************************************
******************************************************************
Run the command:
        terraform apply -var-file="../accountdetails.tfvars"

