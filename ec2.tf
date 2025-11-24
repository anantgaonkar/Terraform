#create ec2 instance in public subnet
resource "aws_instance" "nginx_server" {
  ami = "ami-0cae6d6fe6048ca2c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_terra.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true
  
  user_data = <<-EOF
            #!/bin/bash
            sudo yum install nginx -y
            sudo systemctl start nginx
            EOF 

  tags = {
    Name = "my_nginx server"
  }
}