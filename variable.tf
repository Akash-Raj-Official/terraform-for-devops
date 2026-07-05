variable "aws_region" {
  description = "AWS region where resource will provision"
  type = string
  default = "us-east-1"
}

variable "ami_id" {
  description = "AWS ubuntu id for ec2 instance"
  type = string
  default = "ami-0b6d9d3d33ba97d99"
}

variable "instance_type" {
  description = "AWS instance type for ec2"
  type = string
  default = "t2.micro"
}

variable "vol_type" {
  description = "AWS instance type"
  type = string
  default = "gp3"
}

variable "vol_size" {
  description = "AWS instance size"
  type = number
  default = 15
}

variable "env" {
  default = "dev"
  type = string
  description = "Set env and validate configuration"
}
