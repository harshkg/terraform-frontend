variable "aws_region" {
  default     = "us-east-2"
}

variable "domain" {
  default = "terraform-frontend"
}

variable "iam_path" {
  default     = "/"
  description = "Path in which to create the IAM Role and the IAM Policy."
}

variable "description" {
  default     = "Managed by Terraform"
  description = "The description of the all resources."
}