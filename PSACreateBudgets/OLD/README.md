
CREATE THE SNS TOPICS AND SUBSCRIBERS
=====================================
Terraform cannot create SNS email topics, therefore we are using a cloudformation template to do that for us.
	BA - Account budget
	BD - Daily budget
  all_BA_subscriptions.dat	INPUT 	list of all email addresses enclosed in quotes and comma seperated to receive the Account Budget information.
                                        This list should be enclosed in square brackets.
                                        e.g. ["aaaa@email","bbbb@email"]

  all_BD_subscriptions.dat	INPUT	list of all email addresses enclosed in quotes and comma seperated to receive the Daily Budget information.
                                        This list should be enclosed in square brackets.
                                        e.g. ["aaaa@email","bbbb@email"]
                                        
  sns.auto.tfvars		OUTPUT	The variables used by the SNS creation scripts
                                Change the BDPHH, BAPHH to the actual account name, e.g. Pepperonis
                                        BAdisplay_name="BAPHH Account Budget Information"
                                        BDdisplay_name="BDPHH Daily   Budget Information"
                                        BAemail_addresses=["phhrio@tutanota.com","paul.hh@tutanota.com"]
                                        BDemail_addresses=["phhrio@tutanota.com","paul.hh@tutanota.com"]
TERRAFORM SCRIPTS
=================
The main.tf script will:
	1) Create the SNS topic and subscriptions
	2) Create the monthly budget 
	3) Create the policy required for the daily budget lambda function
	4) Create the role to be used by the daily budget lambda function
	5) Attach the two AWS defined policies and policy we defined above to the role
	6) Create the Lamabda function.
	7) Create the AWS EventBridge rule used by the function
	8) Assign the premissions to the function to allow it to run

IMPORTANT
=========
Historically sometimes destroying the Lambda function using "terraform destroy" will have issues and did not destroy the Cloudwatch rule used by the daily budget.
In these cases the rule had to be deleted manually and then we ran "terraform destroy" again to clean up the state files.
This hasn't happened for a while now.

