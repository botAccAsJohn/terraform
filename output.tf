output "public_ip" {
  value       = aws_instance.my_instance.public_ip
  description = "The public IP address of the EC2 instance"
}

output "private_ip" {
  value       = aws_instance.my_instance.private_ip
  description = "The private IP address of the EC2 instance"
}

output "instance_id" {
  value       = aws_instance.my_instance.id
  description = "The ID of the EC2 instance"
}

output "instance_state" {
  value       = aws_instance.my_instance.instance_state
  description = "The current state of the EC2 instance"
}