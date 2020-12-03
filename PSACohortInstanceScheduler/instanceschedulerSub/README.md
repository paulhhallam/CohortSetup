Pass
1) Environment variables use TF_VAR_myvar=value
2) terraform aplpy -var 'myvar=value'



These instructions will install the AWS instance scheduler as described in the AWS documentation.

The instance scheduler is controlled form the Organisation account and only a part of this needs installing for each new cohort.

The rest of the documentation is in the README for the "instanceschedulerOrg" module directory

Download, extract and install the AWS scheduler cli
===================================================
Using the instructions in https://docs.aws.amazon.com/solutions/latest/instance-scheduler/appendix-a.html download 
https://s3.amazonaws.com/solutions-reference/aws-instance-scheduler/latest/scheduler-cli.zip
unzip scheduler-cli.zip
cd .\scheduler-cli\
sudo python3 setup.py install

#========================
#Cross Account Scheduling
#========================

This 'instanceschedulerSUB.template' creates the AWS Identity and Access Management (IAM) roles necessary to start 
and stop instances in the secondary account. 
You can review and modify permissions in the template before you launch the stack.

To apply automated start-stop schedules to resources in secondary accounts, make sure the organisation owner has 
launched the main solution template (instanceschedulerOrg.template) in the primary account. 
Then launch this Sub template (instanceschedulerSub) in each applicable secondary account. 
When this stack is launched, it creates a cross-account role. 
Update the main solution stack with each cross-account role ARN by entering the appropriate 
ARN(s) in the Cross-account roles parameter and rerunning 
OR 
just add the ARN to the dynamodb list in the organisation account to allow the AWS Instance 
Scheduler to perform start and stop actions 
on instances in the secondary accounts.

#AWS Systems Manager Parameter Store
#-----------------------------------
IF performing the operation manually using the aws cli and not terraform:

The Instance Scheduler enables you to use AWS Systems Manager Parameter Store to store cross-account role ARNs. 
You can store cross-account ARNs as a list parameter where every item is an ARN, or as a string parameter that 
contains a comma-delimited list of ARNs. The parameter has the format {param:name} where the name is the name 
of the parameter in the parameter store.

To leverage this feature, you must launch the Instance Scheduler stack in the same account as your parameter store.
Connect to the Organisation account:
  $ aws configure (e.g. psa)

Create the Instance Scheduler stack in the organisation account
  $ aws cloudformation create-stack --stack-name InstanceScheduler --template-body file://instance-schedulerOrg.template --parameters file://StackParamsOrg.json --capabilities CAPABILITY_NAMED_IAM

Connect to the Sub account:
  $ aws configure (e.g.bd4)

Create the Instance Scheduler sub account stack
  $ aws cloudformation create-stack --stack-name InstanceScheduler --template-body file://instance-schedulerOrg-remote.template --parameters file://StackParamsOrg-remote.json --capabilities CAPABILITY_NAMED_IAM

  Make a note of the CrossAccountRole ARN

Connect to the Organisation account:
  $ aws configure (e.g. psa)
  
Update the organisation stack with the Cross Account Role ARN created in the sub account
  $ aws cloudformation update-stack --stack-name InstanceScheduler --template-body file://instance-schedulerOrg-remote.template --parameters 
   ParameterKey="CrossAccountRoles",ParameterValue="arn:aws:iam::780480840318:role/InstanceScheduler-EC2SchedulerCrossAccountRole-1MCYX7AD5QPG0" --capabilities CAPABILITY_NAMED_IAM

An error occurred (ValidationError) when calling the UpdateStack operation: Parameters: [InstanceSchedulerAccount] must have values

#
# test
#
Assuming the organisation account has the following defined :
1) a scheduler period called "MyCore-Hours"
   e.g. $ scheduler-cli create-period   --stack InstanceScheduler --name "MyCore-Hours"   --weekdays mon-fri --begintime 10:00 --endtime 11:00
2) a schedule called "MyCoreHours"
   e.g. $ scheduler-cli create-schedule --stack InstanceScheduler --name MyCoreHours      --periods MyCore-Hours --timezone UTC
3) the tag used by the instance sceduler is "OrgSchedule"

In BD4 add theub account add the tag "OrgSchedule,MyCoreHours" to an EC2 instance
Wait 5 mins
The instance should be down.

# AWS Instance Scheduler documentation
# https://aws.amazon.com/solutions/implementations/instance-scheduler/
# https://aws.amazon.com/premiumsupport/knowledge-center/stop-start-instance-scheduler/
#
# AWS Instance Scheduler Template locations
# https://s3.eu-west-2.amazonaws.com/cf-templates-17un5cz3tvua5-eu-west-2/2020183trV-Schedule1
# https://s3-external-1.amazonaws.com/cf-templates-17un5cz3tvua5-us-east-1/2020183I9A-Schedule1

