resource "aws_s3_bucket" "remote-s3" {
    bucket = "my-remote-s3-bucket0407"

    tags = {
        Name = "my-remote-s3-bucket0407"
        Environment = "Dev"
    }
}