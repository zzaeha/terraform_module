#Route Table 설정
resource "aws_route_table" "zzaeha_rt" {
  vpc_id = aws_vpc.zzaeha_vpc.id

  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zzaeha_ig.id
  }
  tags = {
    "Name" = "zzaeha-rt"
  }
}