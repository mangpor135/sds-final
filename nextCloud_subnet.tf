resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "vpc"
  }
}

resource "aws_subnet" "nextcloud_public_subnet" {
  availability_zone = var.availability_zone
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_app_cidr
  tags = {
    "Name" = "nextcloud_public_subnet"
  }
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_subnet" "nextcloud_private_subnet" {
  availability_zone = var.availability_zone
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_app_cidr
  
  tags = {
    "Name" = "nextcloud_private_subnet"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "internet_gateway"
  }
}