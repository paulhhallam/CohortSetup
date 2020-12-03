##########################################################################
# Create the user accounts
##########################################################################

resource "aws_iam_user" "clogins" {
  count = length(var.iam_cohort_users)
  name = var.iam_cohort_users[count.index]
  tags = {
    "owner" = "psa"
    "app" = "createcohort"
  }
}

resource "aws_iam_user_login_profile" "clogin_profiles" {
  count = length(var.iam_cohort_users)
  password_reset_required = true
  pgp_key = "keybase:paulhhallam"
  user = var.iam_cohort_users[count.index]
}

resource "aws_iam_user" "calogins" {
  count = length(var.iam_dev_admin_users)
  name = var.iam_dev_admin_users[count.index]
  tags = {
    "owner" = "psa"
    "app" = "createcohort"
  }
}

resource "aws_iam_user_login_profile" "calogin_profiles" {
  count = length(var.iam_dev_admin_users)
  password_reset_required = true
  pgp_key = "keybase:paulhhallam"
  user = var.iam_dev_admin_users[count.index]
}

resource "aws_iam_user" "plogins" {
  count = length(var.iam_psa_admin_users)
  name = var.iam_psa_admin_users[count.index]
  tags = {
    "owner" = "psa"
    "app" = "createcohort"
  }
}

resource "aws_iam_user_login_profile" "plogin_profiles" {
  count = length(var.iam_psa_admin_users)
  password_reset_required = true
  pgp_key = "keybase:paulhhallam"
  user = var.iam_psa_admin_users[count.index]
}

#####################################################################################
# Assign the users to their groups
#####################################################################################
resource "aws_iam_user_group_membership" "Developers" {
  count = length(var.iam_cohort_users)
  user = var.iam_cohort_users[count.index]
  groups = [
    var.DEVS-Amplifygroup,
    var.DEVS-IAMPermgroup,
    var.DEVS-Lambdagroup,
    var.DEVS-S3group,
    var.DEVSG1group,
    var.DEVSG2group,
    var.DEVSG3group,
    var.DEVS_SSM_SSHgroup
  ]
}

resource "aws_iam_user_group_membership" "DevAdmins" {
  count = length(var.iam_dev_admin_users)
  user = var.iam_dev_admin_users[count.index]
  groups = [
    var.DEVS-Adminsgroup
  ]
}

resource "aws_iam_user_group_membership" "PSAAdmins" {
  count = length(var.iam_psa_admin_users)
  user = var.iam_psa_admin_users[count.index]
  groups = [
    var.PSA-Adminsgroup
  ]
}


