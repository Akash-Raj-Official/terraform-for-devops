# Region

provider "aws" {
  region = "us-east-1"
}

# Key Pair

resource aws_key_pair my_key {
  key_name = "my-key"
  public_key = file("my-key.pub")
}

# VPC Default

resource aws_default_vpc default {
  
}

# Security Group

resource aws_security_group my_sg {
  name = "my-sg"
  vpc_id = aws_default_vpc.default.id
  description = "This is my instance security group"

  # Ingress rule
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
  }

  # Outbound rule
  
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance

resource aws_instance my_instance {
  
  for_each = tomap({
    My-automate-instance-micro = "t2.micro", 
    My-automate-instance-medium = "t2.medium"
  })
  # count = 1  # Create 3 instance in one go
  ami = var.ami_id
  region = var.aws_region
  instance_type = each.value  # var.instance_type
  key_name = aws_key_pair.my_key.key_name
  user_data = file("script.sh")
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  depends_on = [aws_security_group.my_sg, aws_key_pair.my_key]

  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.vol_size
    volume_type = var.vol_type
  }
  
  tags = {
    Name = each.key # "My-automated-server"
  }
}
