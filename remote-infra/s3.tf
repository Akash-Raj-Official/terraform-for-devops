resource "random_string" "bucket_suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "aws_s3_bucket" "remote-s3" {
  bucket        = "my-remote-s3-bucket-${random_string.bucket_suffix.result}"
  force_destroy = true

  tags = {
    Name        = "my-remote-s3-bucket-${random_string.bucket_suffix.result}"
    Environment = "Dev"
  }
}