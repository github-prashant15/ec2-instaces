resource "aws_instance" "ubuntu" {
  ami             = "ami-04505e74c0741db8d"
  instance_type   = var.instaces
  security_groups = [aws_security_group.web-sg.name]

  tags = {
    name = "web_instaces"
  }
}

resource "aws_security_group" "web-sg" {
  name = "SecurityGroup"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
