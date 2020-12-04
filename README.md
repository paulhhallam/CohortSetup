These instructions should be executed in this order and will allow the user to:
===============================================================================


        Under OnceOnlySetup
                Set up the terraform state locking to prevent two or more people 
		running state changes at the same time

	Under PSACreateAccounts
	 	create the IAM roles, Groups and Policies
		Create the iam users and assign the relevant groups

	Under PSACreateBudgets
		Create the monthly budget monitoring and alerting under AWS Budgets
		Create the Daily budget alert which sens emails to account owners if budgets exceed pre-defined values 

	Under PSACreateTagging
		Create the Lambda, Cloudwatch and CloudTrail setup using Cloudformation temp[lates to auto tag EC2 and RDS

	Under PSACohortInstanceScheduler
		This creates the role that allows the organisation owner account to schedule instance (EC2 and RDS) shutdowns 
		Record the output of this script as it will be needed for configuring the Organisation schedule manager

IMPORTANT
=========

1) 	The Purple Sky Academy account can be passed in using the command line or it can be set in the file accountdetails.tfvars (mentioned below)
	e.g.
		$ export TF_VAR_OrgAccountId="940700818461"
        	$ terraform apply -var-file="../accountdetails.tfvars"

2) 	The file default_accountdetails.tfvars should be copied to accountdetails.tfvars
	n.b. this file is in .gitignore and will not be uploaded to git as it will contain email addresses.

To run
======

a)	using "aws configure" setup the environment to connect to the new cohort account 

b) 	copy default_accountdetails.tfvars to accountdetails.tfvars, edit and set the variables as required.
	e.g. for cohort "a27-who-are-they"

		cohort_id = "a27-who-are-they"

		monthly_budget_alert_email_list = ["finbarro@tutanota.com", "paul.hh@tutanota.com", "Elwyn@tutanota.com", "psabod1@tutanota.com"]
		daily_budget_alert_list = ["finbarro@tutanota.com", "paul.hh@tutanota.com"]

		slack_default_channel_name = "cloud-env-ops"
		slack_cohort_channel_name = "a27-who-are-they"

		iam_cohort_users    = ["user1@tutanota.com","user3@tutanota.com","user2@tutanota.com"]
		iam_dev_admin_users = ["DevAdminA@tutanota.com", "DevAdminB@tutanota.com"]
		iam_admin_users     = ["PSA_AdminA@tutanota.com","PSA_AdminB@tutanota.com","PSA_AdminC@tutanota.com"]


c)      cd OnceOnlySetup
        terraform init
	terraform apply -var-file="../accountdetails.tfvars"
        Some errors can occur so please do read the README.md in that directory.

c) 	cd ..
	cd PSACreateAccounts
	terraform init
	terraform apply -var-file="../accountdetails.tfvars"
	Some errors can occur so please do read the README.md in that directory.

d) 	cd ..
	cd PSACreateBudgets
        terraform init
	terraform apply -var-file="../accountdetails.tfvars"

e)	cd ..
	cd PSACreateTagging
        terraform init
	terraform apply -var-file="../accountdetails.tfvars"

f)	cd ..
	cd PSACohortInstanceScheduler
        terraform init
	terraform apply -var-file="../accountdetails.tfvars"

