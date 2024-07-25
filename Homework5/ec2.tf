data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_type[0].instance_type
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("ubuntu_apache.sh")
  availability_zone = element(["us-west-2a", "us-west-2b", "us-west-2c"], count.index)
  subnet_id = aws_subnet.main[count.index].id
  count = length(var.subnet)

  tags = {
    Name = var.ec2_type[0].name
  }
}

resource "aws_instance" "linux" {
  ami           = data.aws_ami.linux.id
  instance_type = var.ec2_type[1].instance_type
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("linux_apache.sh")
  availability_zone = element(["us-west-2a", "us-west-2b", "us-west-2c"], count.index)
  subnet_id = aws_subnet.main[count.index].id
  count = length(var.subnet)

  tags = {
    Name = var.ec2_type[1].name
  }
}

output ec2 {
    value = aws_instance.ubuntu.public_ip
    value = aws_instance.linux.public_ip
} 