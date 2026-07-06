resource "aws_s3_bucket" "remote-s3" {
  bucket        = "${var.env}-${var.bucket_name}-akash"

  tags = {
    Name        = "${var.env}-${var.bucket_name}-akash"
    Environment = var.env
  }
}
