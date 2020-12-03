set TF_VAR_OrgAccountId="940700818461"

        terraform apply -var-file="../accountdetails.tfvars"
or
        terraform apply -var-file="../accountdetails.tfvars" -auto-approve




To create the new cohort account, its policies, groups, users, budgets, autotagging and scheduler execute 

	"create-psa-sub.bash"

To 'almost' delete the account execute 

	"destroy-psa-sub.bash". 

This will NOT perform the final deletion of the account but it will delete the policies, groups, users, budgets etc that these scripts have previously created.

The destroy procedure can save the IAM setup but terraform does not have a simple way to execute the AWS command; because of this if you wish to save the account setup then AWS CLI must be installed and you must be connected to the account (i.e. aws configure"). The script gives you the option of bypassing this step and therefore you do not have to have aws cli installed.

Each of the individual steps required can be executerd by entering the subdirectory and executing the terraform scripts; it should be noted however that the primary tfstate file will then be incorrect.

TERRAFORM SCRIPTS
=================
Each directory listed here has its own README file to aid in understanding what is being performed.

Under the "OrgSubAccount" directory

  These scripts will create the Organisation sub account 

  The account is created using the terraform scripts in the "OrgSubAccount" subdirectory.


Under the Accounts directory

  These scripts will create the policies, groups and users

 	User management

	policies

	groups

	users

  The above are all created using terraform scripts in the "Accounts" subdirectory.

  Note that because of the way users and groups are configured should an error occur when creating or deleting an account the terraform user just needs to run the "terraform apply" command twice.


Under the InstanceMgmt directory

  The following are all created 

	the autotag rules and function

	the instance scheduler organisation setup

        the instance scheduler sub account policy setup

  The above are all created using terraform scripts in the "InstanceMgmt" subdirectory.

N.B. once the instance scheduler sub account policy the policy ARN, outputted by the terraform script, needs to be added to the list of ARN's in the instance scheduler organisation dynamo db table.
Hopefully I will be able to complete this soon.
