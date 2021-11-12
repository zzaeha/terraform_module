#서브넷 설정

#가용영역 a의 public subnet
resource "aws_subnet" "zzaeha_pub_a" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "zzaeha-pub-a"
  }
}

#가용영역 a의 private subnet
resource "aws_subnet" "zzaeha_pri_a" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "zzaeha-pri-a"
  }
}

#가용영역 c의 public subnet
resource "aws_subnet" "zzaeha_pub_c" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "zzaeha-pub-c"
  }
}

#가용영역 c의 private subnet
resource "aws_subnet" "zzaeha_pri_c" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "zzaeha-pri-c"
  }
}


#가용영역 a의 private DB subnet
resource "aws_subnet" "zzaeha_pri_dba" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "zzaeha-pri-dba"
  }
}

#가용영역 c의 private DB subnet
resource "aws_subnet" "zzaeha_pri_dbc" {
  vpc_id = aws_vpc.zzaeha_vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "zzaeha-pri-dbc"
  }
}