# Terraform for DevOps

A Terraform infrastructure-as-code project for deploying AWS resources with automated EC2 instance provisioning and remote infrastructure management.

## Project Structure

```
.
├── ec2.tf                 # EC2 instances, security groups, and key pairs
├── variable.tf            # Variable definitions
├── terraform.tf           # Terraform provider configuration
├── output.tf              # Output values
├── script.sh              # User data script for EC2 initialization
├── my-key                 # Private key file
├── my-key.pub             # Public key file
├── terraform.tfstate      # Terraform state file
└── remote-infra/          # Remote infrastructure configuration
    ├── s3.tf              # S3 bucket configuration
    ├── dynamodb.tf        # DynamoDB table configuration
    ├── provider.tf        # Remote provider setup
    └── terraform.tf       # Remote infrastructure settings
```

## Main Infrastructure Components (ec2.tf)

### 1. AWS Provider
- **Region**: us-east-1
- Manages all AWS resources

### 2. Key Pair
- **Name**: my-key
- **Purpose**: SSH access to EC2 instances
- Uses public key from `my-key.pub`

### 3. VPC & Security Group
- **VPC**: Default AWS VPC
- **Security Group**: my-sg
  - **Inbound Rules**:
    - SSH (Port 22) - Open to 0.0.0.0/0
    - HTTP (Port 80) - Open to 0.0.0.0/0
  - **Outbound Rules**: All traffic allowed

### 4. EC2 Instances
Creates two instances using `for_each` loop:
- **My-automate-instance-micro**: t2.micro instance
- **My-automate-instance-medium**: t2.medium instance

**Instance Configuration**:
- AMI: Variable-based (`var.ami_id`)
- Instance Type: Based on each instance definition
- Key Pair: my-key
- User Data: Executes `script.sh`
- Root Volume Size: 
  - Production (prod): 20GB
  - Development: Variable-based (`var.vol_size`)
- Volume Type: Variable-based (`var.vol_type`)
- Tags: Instance name from each.key

## Remote Infrastructure (remote-infra/)

### S3 Configuration
- S3 bucket setup for state and artifact storage

### DynamoDB Configuration
- DynamoDB table for state locking and data management

## Prerequisites

- Terraform >= 1.0
- AWS CLI configured with credentials
- SSH key pair generated (my-key, my-key.pub)
- AWS account with appropriate IAM permissions

## Variables

Key variables used in this project:
- `ami_id`: AMI ID for EC2 instances
- `aws_region`: AWS region
- `instance_type`: EC2 instance type
- `env`: Environment (prod/dev)
- `vol_size`: EBS volume size
- `vol_type`: EBS volume type

## Usage

### 1. Initialize Terraform
```bash
terraform init
```

### 2. Plan Infrastructure
```bash
terraform plan
```

### 3. Apply Configuration
```bash
terraform apply
```

### 4. Destroy Infrastructure
```bash
terraform destroy
```

### 5. For Remote Infrastructure
```bash
cd remote-infra
terraform init
terraform plan
terraform apply
```

## SSH Access

To connect to your EC2 instances:
```bash
ssh -i my-key ec2-user@<instance-public-ip>
```

## Outputs

Check `output.tf` for exposed outputs like:
- Instance IDs
- Public IPs
- Security group IDs
- VPC information

## Notes

- The security group allows SSH and HTTP from anywhere (0.0.0.0/0). Adjust CIDR blocks for production.
- User data script (`script.sh`) runs on instance startup
- The `for_each` loop allows easy scaling of instances
- Production instances get 20GB volumes; development uses configurable size
- State files are managed both locally and remotely (remote-infra)

## License

MIT