resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "${var.domain}"
  #acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "frontend_bucket" {
  bucket = aws_s3_bucket.frontend_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "frontend_bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.frontend_bucket]

  bucket = aws_s3_bucket.frontend_bucket.id
  acl    = "private"
}