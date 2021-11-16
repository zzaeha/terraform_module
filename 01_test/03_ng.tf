#EIP 생성
resource "aws_eip" "lb_ip"{
  # instance = aws_instance.web.id
  vpc = true
}

#NAT Gateway 생성
resource "aws_nat_gateway" "zzaeha_ng"{
  allocation_id = aws_eip.lb_ip.id
  subnet_id = aws_subnet.zzaeha_pub[0].id
  tags = {
    "Name" = "${var.name}-ng"
  }
}

#NAT Gateway Route Table 생성
resource "aws_route_table" "zzaeha_ngrt"{
  vpc_id = aws_vpc.zzaeha_vpc.id

  route {
    cidr_block = var.cidr
    gateway_id = aws_nat_gateway.zzaeha_ng.id
  }

  tags = {
    "Name" = "${var.name}-ng-rt"
  }
}

#NAT Gateway Association - pri_a 연결
resource "aws_route_table_association" "zzaeha_ngrtas"{
  count = "${length(var.ava)}"
  subnet_id = aws_subnet.zzaeha_pri[count.index].id
  route_table_id = aws_route_table.zzaeha_ngrt.id
}