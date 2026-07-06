variable "env" {
  description = "This is the environment for my infra"
  type = string
}

variable "bucket_name" {
  description = "This is the bucket name for my infra"
  type = string
}

variable "instance_count" {
  description = "This is the no. of ec2 instance"
  type = number
}

variable "instance_type" {
  description = "This is my instance type"
  type = string
}

variable "ami_id" {
  description = "This is my instance ami id"
  type = string
}

variable "hash_key" {
  description = "This is my dynamodb hashkey"
  type = string
}
