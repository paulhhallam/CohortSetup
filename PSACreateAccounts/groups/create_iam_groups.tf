#
### Create the cohort groups
#
resource "aws_iam_group" "DEVSG1group" {
  name = "DEVSG1"
}
resource "aws_iam_group" "DEVSG2group" {
  name = "DEVSG2"
}
resource "aws_iam_group" "DEVSG3group" {
  name = "DEVSG3"
}
resource "aws_iam_group" "DEVS-IAMPermgroup" {
  name = "DEVS-IAMPerms"
}
resource "aws_iam_group" "DEVS-S3group" {
  name = "DEVS-S3"
}
resource "aws_iam_group" "DEVS-Lambdagroup" {
  name = "DEVS-Lambda"
}
resource "aws_iam_group" "DEVS-Amplifygroup" {
  name = "DEVS-Amplify"
}
resource "aws_iam_group" "DEVS-Adminsgroup" {
  name = "DEVS-Admins"
}
#
### Create the PSA Group
#
resource "aws_iam_group" "PSA-Adminsgroup" {
  name = "PSA-Admins"
}
#
### Create the SSM_SSH Group
#
resource "aws_iam_group" "DEVS_SSM_SSHgroup" {
  name = "DEVS_SSM_SSH"
}

