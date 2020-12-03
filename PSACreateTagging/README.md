	terraform apply -var-file="../accountdetails.tfvars"
OR
	terraform apply -var-file="../accountdetails.tfvars" -auto-approve

From https://aws.amazon.com/blogs/recurity/how-to-automatically-tag-amazon-ec2-resources-in-response-to-api-events/

This template will add 3 tags to any EC2 or RDS resource created by users.

    Key:            Value:
    OrgSchedule     CohortHours
    Owner           Owners name
    PrincipalID     Id

This is a combination of an Amazon CloudWatch Events rule and AWS Lambda function to tag newly created instances with, in this case:

   1) An instance scheduler tag "OrgSchedule";
      this is used by the instance scheduler created by running the "PSAInstanceScheduler" repository code.
      If you change this tag name then remember to change the name used by the instance scheduler.

   2) The name of the user who created the resource

   3) The full ID of the user who created the resource

Ensure you are connected to the AWS account using "aws configure"

Using Terraform enter
=====================
	$ terraform apply
Using awscli enter
==================
	$ aws cloudformation create-stack --stack-name AutoTagEC2RDS --template-body file://AutoTagEC2RDS.template --capabilities CAPABILITY_NAMED_IAM

