provider "aws" {
  region = "${var.aws_region}"
  #assume_role {
    #role_arn = "arn:aws:iam::<AWS-ACCOUNT-ID>:role/admin"
    #role_arn = "arn:aws:iam::656119265649:role/EKSClusterAccess"
    #profile = "default"
  #}
}