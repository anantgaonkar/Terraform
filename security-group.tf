resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.terra_vpc.id

#Inbound traffic 
  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks=["0.0.0.0/0"] 
  } 

#Outbound traffic
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  tags = {
    Name="Nginx-sg"
  }
}
