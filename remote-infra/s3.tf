resource "aws_s3_bucket" "remote-s3" {
    bucket = "my-remote-s3-bucket"

    tags = {
        Name = "my-remote-s3-bucket"
        Environment = "Dev"
    }
}