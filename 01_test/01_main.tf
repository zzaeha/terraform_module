#가용영역 지정
provider "aws" {
    region   = var.region
}

 # SSH Key
resource "aws_key_pair" "zzaeha_key" {
  key_name = var.key
  public_key = file("../../.ssh/zzaeha-key.pub")
}

#VPC 설정
resource "aws_vpc" "zzaeha_vpc" {
  cidr_block = var.cidr_main
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

#서브넷 설정
# 가용영역 Public Subnet
resource "aws_subnet" "zzaeha_pub" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  count = length(var.cidr_public) #2
  cidr_block = var.cidr_public[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pub-${var.ava[count.index]}"
  }
}

# 가용영역 Private Subnet
resource "aws_subnet" "zzaeha_pri" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  count = length(var.cidr_private)
  cidr_block = var.cidr_private[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pri-${var.ava[count.index]}"
  }
}

# 가용영역 Private DB subnet
resource "aws_subnet" "zzaeha_pri_db" {
  count = length(var.cidr_privatedb)
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = var.cidr_privatedb[count.index]
  availability_zone = "${var.region}${var.ava[count.index]}"
  tags = {
    "Name" = "${var.name}-pri-db${var.ava[count.index]}"
  }
}