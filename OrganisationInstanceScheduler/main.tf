#
# Add the instance scheduler role to allow the Organisation account to run schedules
#
module "instanceschedulerOrg" {
  source = "./instanceschedulerOrg/"
#  OrgSchedule = ""
}

#resource "aws_dynamodb_table_item" "ConfigTable" {
#  table_name = aws_dynamodb_table.example.name
#  hash_key   = aws_dynamodb_table.example.hash_key
#
#module.instanceschedulerOrg.OrgSchedule["ConfigurationTable"]
#module.instanceschedulerOrg.OrgSchedule["ConfigurationTable"]
#
#  item = <<ITEM
#{
#  "exampleHashKey": {"S": "something"},
#  "one": {"N": "11111"},
#  "two": {"N": "22222"},
#  "three": {"N": "33333"},
#  "four": {"N": "44444"}
#}
#ITEM
#}
#
#"ConfigTableName" {
#  value = module.instanceschedulerOrg.OrgSchedule["ConfigurationTable"]
