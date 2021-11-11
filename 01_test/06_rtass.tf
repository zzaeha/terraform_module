resource "aws_route_table_association" "zzaeha_rtass_a"{
  subnet_id = aws_subnet.zzaeha_pub_a.id
  route_table_id = aws_route_table.zzaeha_rt.id
}
resource "aws_route_table_association" "zzaeha_rtass_c"{
  subnet_id = aws_subnet.zzaeha_pub_c.id
  route_table_id = aws_route_table.zzaeha_rt.id
}