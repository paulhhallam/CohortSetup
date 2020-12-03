#
### Output the DEV groups
#
output "DEVSG1group" {
  value = aws_iam_group.DEVSG1group.name
}
output "DEVSG2group" {
  value = aws_iam_group.DEVSG2group.name
}
output "DEVSG3group" {
  value = aws_iam_group.DEVSG3group.name
}
output "DEVS-IAMPermgroup" {
  value = aws_iam_group.DEVS-IAMPermgroup.name
}
output "DEVS-S3group" {
  value = aws_iam_group.DEVS-S3group.name
}
output "DEVS-Lambdagroup" {
  value = aws_iam_group.DEVS-Lambdagroup.name
}
output "DEVS-Amplifygroup" {
  value = aws_iam_group.DEVS-Amplifygroup.name
}
output "DEVS-Adminsgroup" {
  value = aws_iam_group.DEVS-Adminsgroup.name
}
#
### Output the PSA groups
#
output "PSA-Adminsgroup" {
  value = aws_iam_group.PSA-Adminsgroup.name
}
#
### Output the SSM_SSH Group
#
output "DEVS_SSM_SSHgroup" {
  value = aws_iam_group.DEVS_SSM_SSHgroup.name
}
