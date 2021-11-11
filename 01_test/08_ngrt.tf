resource "aws_route_table" "zzaeha_ngrt"{
  vpc_id = aws_vpc.zzaeha_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.zzaeha_ng.id
  }

  tags = {
    "Name" = "zzaeha-ngrt"
  }
}
