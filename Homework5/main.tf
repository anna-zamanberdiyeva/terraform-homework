provider aws {
    region = var.region
}

# VPC named kaizen

resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_cidr[0].cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "kaizen"
  }
}

# Subnets: 2 public, 2 private

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet[count.index].cidr                             
  availability_zone = "${var.region}${var.subnet[count.index].az}"      
  map_public_ip_on_launch = var.ip_on_launch                            
  count = length(var.subnet)

  tags = {
    Name = var.subnet[count.index].name              #"public1"
  }
}

# Internet Gateway created and attached

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.internet_gateway_name
  }
}

# Route tables : 2, public & private

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.subnet[0].rt_name
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = var.subnet[2].rt_name
  }
}

# Assosiating Route Tables : 2, public & private

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.main[count.index].id
  route_table_id = aws_route_table.rt.id
  count          = length(var.subnet)

}