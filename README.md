These instructions will allow thge user to:

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

IMPORTANT
=========

1) 	The Purple Sky Academy account can be passed in using the command line or it can be set in the file accountdetails.tfvars (mentioned below)
	e.g.
		$ export TF_VAR_OrgAccountId="940700818461"
        terraform apply -var-file="../accountdetails.tfvars"

2) 	The file default_accountdetails.tfvars should be copied to accountdetails.tfvars
	n.b. this file is in .gitignore and will not be uploaded to git as it will contain email addresses.

To run
======

a)	using "aws configure" setup the environment to connect to thge cohort account

b) 	Edit accountdetails.tfvars as mentioned above

c) 	cd PSACreateAccounts
	terraform apply -var-file="../accountdetails.tfvars"
	Some errors can occur so please do read the README.md in that directory.

d) 	cd ..
	cd PSACreateBudgets
        terraform apply -var-file="../accountdetails.tfvars"

e)	cd ..
	cd PSACreateTagging
        terraform apply -var-file="../accountdetails.tfvars"

f)	cd ..
	cd PSACohortInstanceScheduler
        terraform apply -var-file="../accountdetails.tfvars"

