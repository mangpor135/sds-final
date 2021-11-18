resource "aws_subnet" "db_private_subnet" {
  availability_zone = var.availability_zone
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_db_cidr
  tags = {
    "Name" = "db_private_subnet"
  }
}

resource "aws_eip" "db_elastic_ip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.db_elastic_ip.id
  subnet_id     = aws_subnet.nextcloud_public_subnet.id

  tags = {
    "Name" : "nat_gateway"
  }
}