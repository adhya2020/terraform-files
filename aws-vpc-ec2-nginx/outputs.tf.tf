output "instance_public-ip" {
    description = "The Public IP adress of Ec2 Instances"
    value = aws_instance.nginxserver.public_ip
}

output "instance_url" {
    description = "The URL to access the NGINX Server"
    value = "http://${aws_instance.nginxserver.public_ip}"
}