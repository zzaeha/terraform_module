# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "zzaeha_ig" {
  vpc_id = aws_vpc.zzaeha_vpc.id

  tags = {
    "Name" = "zzaeha-ig"
  }
  
}