resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "allow tls traffic"

  variable ports {
  description = "Provide ports"
  type = list(number)
  default = [22, 80, 443]
}

    ingress {
    description      = "TLS from VPC"
    from_port        = var.ports[0] #80
    to_port          = var.ports[0] #80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = var.ports[1] #22
    to_port          = var.ports[1] #22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "TLS from VPC"
    from_port        = var.ports[2] #443
    to_port          = var.ports[2] #443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

variable ports {
  description = "List of ports to allow"
  type = list(number)
  default = [22, 80, 443]
}