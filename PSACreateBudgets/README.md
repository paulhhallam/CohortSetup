        Important notes before you begin


1) Use the following command to perform the apply as the account details are
   held in the cohort main directory
        terraform apply -var-file="../accountdetails.tfvars"
or
	terraform apply -var-file="../accountdetails.tfvars" -auto-approve

2) Creating the SNS topics and subscriptions
   Terraform cannot create SNS email topics,o we are using a cloudformation 
   template to do that for use.

   monthly_budget_alert_email_list	INPUT 	
   list of all email addresses enclosed in quotes and comma seperated 
   to receive the Account Budget information.
         This list is configured in the file ../accountdetails.tfvars

   daily_budget_alert_list		INPUT	
   list of all email addresses enclosed in quotes and comma seperated 
   to receive the Daily Budget information.
         This list is configured in the file ../accountdetails.tfvars
                                        
   sns.auto.tfvars		OUTPUT	
   The variables used by the SNS creation scripts
       Change the BDPHH, BAPHH to the actual account name, e.g. Pepperonis
       BAdisplay_name="BAPHH Account Budget Information"
       BDdisplay_name="BDPHH Daily   Budget Information"

3) Terraform scripts
   The main.tf script will:
	1) Create the SNS topic and subscriptions
	2) Create the monthly budget 
	3) Create the policy required for the daily budget lambda function
	4) Create the role to be used by the daily budget lambda function
	5) Attach the two AWS defined policies and the policy 
           we defined above to the role
	6) Create the Lamabda function.
	7) Create the AWS EventBridge rule used by the function
	8) Assign the premissions to the function to allow it to run

4) Historically sometimes destroying the Lambda function using 
   "terraform destroy" will have issues and did not destroy the 
   Cloudwatch rule used by the daily budget.
   In these cases the rule had to be deleted manually and then we ran 
   "terraform destroy" again to clean up the state files.

