# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "zzaeha_ig" {
  vpc_id = aws_vpc.zzaeha_vpc.id

  tags = {
    "Name" = "${var.name}-ig"
  }
} 

#Route Table 설정
resource "aws_route_table" "zzaeha_rt" {
  vpc_id = aws_vpc.zzaeha_vpc.id

  route{
    cidr_block = var.cidr
    gateway_id = aws_internet_gateway.zzaeha_ig.id
    #  destination_prefix_list_id = "value"
    #  egress_only_gateway_id = "value"
    #  instance_id = "value"
    #  ipv6_cidr_block = "value"
    #  local_gateway_id = "value"
    #  nat_gateway_id = "value"
    #  network_interface_id = "value"
    #  transit_gateway_id = "value"
    #  vpc_endpoint_id = "value"
    #  vpc_peering_connection_id = "value"
  }
  tags = {
    "Name" = "${var.name}-rt"
  }
}

#Public Subnet(zzaeha_pub_a,c) 연결
resource "aws_route_table_association" "zzaeha_rtass_a"{
  count = length(var.cidr_public)
  subnet_id = aws_subnet.zzaeha_pub[count.index].id
  route_table_id = aws_route_table.zzaeha_rt.id
}

output "public_ip" {
  description = "Web EC2 Instance Public_IP Print"
  value = aws_instance.zzaeha_web.public_ip
}

output "Load_dns" {
  description = "Load Balancer Domain Name"
  value = aws_lb.zzaeha_lb.dns_name
}