output "webserver_public_ips" {
    value = [aws_instance.web_server_1.public_ip, aws_instance.web_server_2.public_ip ]
    description = "public IP's of web servers"
}

output "web_sg_id" {
    value = "aws_security_group.web_sg.id"
    description = "ID of web server security group"
}