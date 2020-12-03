#
### Group variables - should be a list really
### variable the DEV groups
variable "DEVSG1group" {
  type = string
  default = ""
}
variable "DEVSG2group" {
  type = string
  default = ""
}
variable "DEVSG3group" {
  type = string
  default = ""
}
variable "DEVS-IAMPermgroup" {
  type = string
  default = ""
}
variable "DEVS-S3group" {
  type = string
  default = ""
}
variable "DEVS-Lambdagroup" {
  type = string
  default = ""
}
variable "DEVS-Amplifygroup" {
  type = string
  default = ""
}
variable "DEVS-Adminsgroup" {
  type = string
  default = ""
}
### variable the PSA groups
variable "PSA-Adminsgroup" {
  type = string
  default = ""
}
### variable the SSM_SSH Group
variable "DEVS_SSM_SSHgroup" {
  type = string
  default = ""
}
