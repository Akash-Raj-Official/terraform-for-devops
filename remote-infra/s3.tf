resource "aws_s3_bucket" "remote-s3" {
  bucket        = "my-remote-s3-bucket-aws"
  force_destroy = true

  tags = {
    Name        = "my-remote-s3-bucket-aws"
    Environment = "Dev"
  }
}