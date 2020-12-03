IMPORTANT NOTES BEFORE YOU BEGIN
================================
================================
================================

1) Terraform cannot create SNS email topics, read the docs if you do not believe me.
   We must create the SNS topic and subscription list first.
   The TOPIC ARN should be exported by the shell script so terraform can use it.
   The scripst I create will create a file PSABudgets.sns which will have the ARN and nothing else in it.
   Might be better just to create the budgets using AWS CLI.
   $ ../PSA/PSAAccountBudget/Create_Budget.sh
   $ ../PSA/PSABudgets/Create_DailyBudget.bash

2) Because of ideosyncrasies in Terraform and the use of groups and policies errors WILL occurr when
   creating and/or deleting the infrastructure.
   It is documented (at least for this version) that you will have to run the "terraform apply/delete" twice 
   in succession to complete the operation successfully.
   We may get around this by converting to modules but that is a little way down the line.

3) To create an Iam user with console login enabled you need to install keybase on your operating system.
   For more information visit https://keybase.io/download

KEYBASE:
#########
INSTALL KEYBASE
===============
For Linux:
$ curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
$ sudo apt install ./keybase_amd64.deb
$ run_keybase
# if you see an error about missing `libappindicator1` from the next
# command, you can ignore it, as the subsequent command corrects it
$ sudo dpkg -i keybase_amd64.deb
$ sudo apt-get install -f
SIGNUP to KEYBASE
=================
$ keybase signup
Your email address: paul.hh@tutanota.com
Your desired username: paulhhallam
A public name for this device [home computer]: home1
▶ WARNING Failed to reach system keyring (primary store (system keyring): failed to open secretservice session: The name org.freedesktop.secrets was not provided by any .service files), 
falling back to secondary store (file-based secret store (see https://keybase.io/docs/crypto/local-key-security)). [tags:ENG=nAX6BLnkqtuW]
▶ INFO Signed up and provisioned a device. [tags:ENG=nAX6BLnkqtuW]
Welcome to keybase.io!
   - you are now logged in as paulhhallam
   - your profile on keybase is https://keybase.io/paulhhallam
   - type 'keybase help' for more instructions
Found a bug? Please report it with `keybase log send`
Enjoy!
GENERATE A KEY
==============
$ keybase pgp gen
Enter your real name, which will be publicly visible in your new key:                   paulhhallam
Enter a public email address for your key:                                              paul.hh@tutanota.com
Enter another email address (or <enter> when done): 
When exporting to the GnuPG keychain, encrypt private keys with a passphrase? [Y/n]     n
▶ INFO PGP User ID: paulhhallam <paul.hh@tutanota.com> [primary]
▶ INFO Generating primary key (4096 bits)
▶ INFO Generating encryption subkey (4096 bits)
▶ INFO Generated new PGP key:
▶ INFO   user: paulhhallam <paul.hh@tutanota.com>
▶ INFO   4096-bit RSA key, ID B05C139578395515, created 2020-09-08
▶ INFO Exported new key to the local GPG keychain
$
USE THE KEYNAME IN TERRAFORM
============================
resource "aws_iam_user_login_profile" "login_profile" {
  count = length(var.iam_users)
  password_reset_required = true
  pgp_key = "keybase:paulhhallam"
  user = var.iam_users[count.index]
}
$ terraform apply
Decrypt the keybase password 
============================
$ terraform output passwords | base64 -di | keybase pgp decrypt

qy}2hCxjm{QSCv]YZ^8+


