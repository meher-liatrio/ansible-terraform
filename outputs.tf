output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.self_hosted_runner.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.self_hosted_runner.public_ip
}
