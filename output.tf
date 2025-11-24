output "instance_public_ip" {
description = "public ip of instance"  
value = aws_instance.nginx_server.public_ip
}

output "Instance_URL"{
description = "URL of instance"
value = "http://${aws_instance.nginx_server.public_ip}"
}