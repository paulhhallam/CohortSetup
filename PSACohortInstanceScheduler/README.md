This will add the relevant policies to the cohort account to allow the Organisation owning account to run its Scheduling Lambda functions against this account.

Set the required variables in ../accountdetails.tfvars
An example file is available as "../default_accountdetails.tfvars"
The unique cohort_id value must be defined in this file and it must be the same unique name as used for the OnceOnlySetup (i.e. the terraform state file setup in S3)

If a ".terraform" directory exists from running this code on another account then:
a) Remove the directory "$ rm -Rf .terraform"
b) Run the init "$ terraform init"
   You will be asked for the state files bucket name; the one that was created when the cohort OnceOnlySetup was run.
e.g.    Initializing the backend...
        bucket
          The name of the S3 bucket
          Enter a value: bd35-psa-cohort-state-files

******************************************************************
******************************************************************
**  IMPORTANT - remember to add the -var-file when running apply
******************************************************************
******************************************************************
Run the command:
        terraform apply -var-file="../accountdetails.tfvars"

