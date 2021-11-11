#NAT Gateway Association - pri_a 연결
resource "aws_route_table_association" "zzaeha_ngass_a"{
  subnet_id = aws_subnet.zzaeha_pri_a.id
  route_table_id = aws_route_table.zzaeha_ngrt.id
}
#NAT Gateway Association - pri_c 연결
resource "aws_route_table_association" "zzaeha_ngass_c"{
  subnet_id = aws_subnet.zzaeha_pri_c.id
  route_table_id = aws_route_table.zzaeha_ngrt.id
}