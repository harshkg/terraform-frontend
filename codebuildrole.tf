resource "aws_iam_role" "codebuild_role" {
  name = "codebuild-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Policy for CodeBuild
resource "aws_iam_policy" "codebuild_policy" {
  name        = "codebuild-policy"
  description = "Policy for CodeBuild"
  
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketPolicy",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::your-source-bucket/*",
        "arn:aws:s3:::your-artifacts-bucket/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:CreateReportGroup",
        "codebuild:CreateReport",
        "codebuild:UpdateReport",
        "codebuild:BatchPutTestCases",
        "codebuild:StartBuild",
        "codebuild:BatchGetBuilds",
        "codebuild:BatchGetProjects"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach CodeBuild policy to the CodeBuild role
resource "aws_iam_policy_attachment" "codebuild_policy_attachment" {
    name = aws_iam_role.codebuild_role.name
    policy_arn = aws_iam_policy.codebuild_policy.arn
    roles = [aws_iam_role.codebuild_role.name]
}

