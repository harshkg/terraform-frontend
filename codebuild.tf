resource "aws_codebuild_project" "frontend_terraform" {
  name = "terraform-frontend"
  description = "My CodeBuild Terraform"
  
  build_timeout = 60
  #service_role = "arn:aws:iam::656119265649:role/Kuberenetes_role"
  service_role = aws_iam_role.codebuild_role.arn
  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
    type         = "LINUX_CONTAINER"
  }
  artifacts {
    type = "NO_ARTIFACTS"
  }
  source {
    type            = "GITHUB"
    location        = "https://github.com/harshkg/terraform-frontend.git"
    git_clone_depth = 1
    buildspec       = "buildspec.yml"  # Your BuildSpec file name
  }
}