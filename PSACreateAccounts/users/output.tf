output "userids" {
  value = ["${aws_iam_user_login_profile.clogin_profiles.*.user}"]
}
output "passwords" {
  value = ["${aws_iam_user_login_profile.clogin_profiles.*.encrypted_password}"]
}
output "puserids" {
  value = ["${aws_iam_user_login_profile.plogin_profiles.*.user}"]
}
output "ppasswords" {
  value = ["${aws_iam_user_login_profile.plogin_profiles.*.encrypted_password}"]
}