#Security Group 생성
resource "aws_security_group" "zzaeha_sg"{
  name = "Allow Basic"
  description = "Allow HTTP,SSH,SQL,ICMP"
  vpc_id = aws_vpc.zzaeha_vpc.id

  ingress = [
    {
      description = "Allow HTTP"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]

      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
  egress = [
    {
      description = "ALL"
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
  tags = {
    "Name" = "zzaeha-sg"
  }
}