
	Important notes before you begin


1) Use the following command to perform the apply as the account details are 
   held in the cohort main directory
	terraform apply -var-file="../accountdetails.tfvars" 
or
	terraform apply -var-file="../accountdetails.tfvars" -auto-approve

2) Ignore some errors
   Because of ideosyncrasies in Terraform and its implementation of groups and 
   policies errors WILL occurr when creating and/or deleting the infrastructure.

   It is documented (at least for this version) that you will have to run the 
   "terraform apply/delete" twice in succession to complete the 
   operation successfully.
	Error: Error creating IAM User Login Profile for "phhA": NoSuchEntity: 
	The user with name phhA cannot be found.
        status code: 404, request id: 90576f65-f044-4ef7-8577-4ff3c347c731
   and
	Error: Error attaching policy  to IAM group DEVSG2: InvalidParameter: 
	1 validation error(s) found.
	- minimum field size of 20, AttachGroupPolicyInput.PolicyArn.
   Run the command a second time and the errors should disappear.
   If they do not then you do have an issue.


3) Create the encrypted passwords
   To create an Iam user with console login enabled you need to install 
   keybase on your operating system.
   For more information visit https://keybase.io/download

   Read the README_keybase.md for instructions on using keybase and 
   decrypting the password it creates for the AWS users
         =================

