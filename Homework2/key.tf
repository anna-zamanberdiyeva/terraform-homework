# Key upload
 
resource "aws_key_pair" "key_az" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}