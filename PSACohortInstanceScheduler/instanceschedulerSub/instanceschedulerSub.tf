resource "aws_cloudformation_stack" "InstanceSchedulerSub" {
  name = "psa-InstanceSchedulerSub"
  template_body = file("${path.module}//instanceschedulerSub.template")
  capabilities = ["CAPABILITY_IAM"]
  parameters = {
    InstanceSchedulerAccount = var.OrgAccountId
  }
  tags = {
          owner = "psa"
          app = "InstanceScheduler"
         }
}

