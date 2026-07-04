resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "my-dynamodb-table-1"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "my-dynamodb-table"
  }
}