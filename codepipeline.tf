resource "aws_codepipeline" "my_pipeline" {
  name     = "my-codepipeline"
  #role_arn = aws_iam_role.my_codepipeline_role.arn
  role_arn = "${aws_iam_role.default.arn}"

  artifact_store {
    location = "${var.domain}"
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        Owner                  = "harshkg"
        Repo                   = "terraform-frontend"
        Branch                 = "main"
        OAuthToken             = "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"
        PollForSourceChanges   = "false"
        #OutputArtifactFormat  = "CODEPIPELINE"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "BuildAction"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      version         = "1"
      input_artifacts = ["source_output"]

      configuration = {
        ProjectName = aws_codebuild_project.frontend_terraform.name
      }
    }
  }
}