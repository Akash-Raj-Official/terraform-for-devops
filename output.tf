# Output for counts
#output "ec2_arn" {
#  description = "ARN for ec2 instance"
#  value = aws_instance.my_instance[*].arn
#}

#output "ec2_public_ip" {
#  description = "Public ip for ec2 instance"
#  value = aws_instance.my_instance[*].public_ip
#}

#output "ec2_private_ip" {
#  description = "Private ip for ec2 instance"
#  value = aws_instance.my_instance[*].private_ip
#}

#output "ec2_public_dns" {
#  description = "Public dns for ec2 instance"
#  value = aws_instance.my_instance[*].public_dns
#}


# Output for for_each
output "ec2_public_ip" {
  value = [
    for key in aws_instance.my_instance : key.public_ip
  ]
}

output "ec2_private_ip" {
  value = [
    for key in aws_instance.my_instance : key.private_ip
  ]
}

output "ec2_public_dns" {
  value = [
    for key in aws_instance.my_instance : key.public_dns
  ]
}
