Instructions For the Organisation account
=========================================

Ensure you are connected to the Organisation account

Run:
$ terraform init
$ terraform apply

The variables have been initialsed to null therefore the user will be prompted for
  bdname	- i.e. the name of the subaccount
  bdemail - i.e. the email address of the root owner of the new account

e.g.

  $ terraform apply
  var.bdemail
    The sub account root email address

    Enter a value: test@test

  var.bdname
    The sub account name

    Enter a value: test
:

NOTE
Running "terraform destroy" will only remove the association of the sub account with the organisation, it will not close the sub account.

