# Key Pair

resource aws_key_pair my_key {
  key_name = "${var.env}-infra-app-key"
  public_key = file("my-key.pub")

  tags = {
    Environment = var.env
  }
}

# VPC Default

resource aws_default_vpc default {
  
}

# Security Group

resource aws_security_group my_sg {
  name = "${var.env}-infra-app-sg"
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

  tags = {
    Name = "${var.env}-infra-app-sg"
  }
}

# EC2 Instance

resource aws_instance my_instance {
 
  count = var.instance_count  # Create 3 instance in one go
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp3"
  }
  
  tags = {
    Name = "${var.env}-infra-app-instance"
    Environment = var.env
  }
}
