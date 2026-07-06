# dev infra structure
module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "infra-app-bucket"
  instance_count = 1
  instance_type = "t2.micro"
  ami_id = "ami-0b6d9d3d33ba97d99"
  hash_key = "studentID"
}

module "prod-infra" {
  source = "./infra-app"
  env = "prod"
  bucket_name = "infra-app-bucket"
  instance_count = 2
  instance_type = "t2.medium"
  ami_id = "ami-0b6d9d3d33ba97d99"
  hash_key = "studentID"
}

module "stg-infra" {
  source = "./infra-app"
  env = "stg"
  bucket_name = "infra-app-bucket"
  instance_count = 1
  instance_type = "t2.small"
  ami_id = "ami-0b6d9d3d33ba97d99"
  hash_key = "studentID"
}
