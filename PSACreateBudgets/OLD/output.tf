#output "Account_SNS_Arn" {
#
#  value = var.BATopicARN
#}
#
#output "Daily_SNS_Arn" {
#  value = var.BDTopicARN
#}

output "BAarn" {
  value       = "${aws_cloudformation_stack.BAsns_topic.outputs["ARN"]}"
  description = "Email Account Budget SNS topic ARN"
}

output "BDarn" {
  value       = "${aws_cloudformation_stack.BDsns_topic.outputs["ARN"]}"
  description = "Email Daily Budget SNS topic ARN"
}
