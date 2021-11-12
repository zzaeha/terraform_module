#Application Load Balancer 생성
resource "aws_lb" "zzaeha_alb" {
  name = "zzaeha-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.zzaeha_sg.id]
  subnets = [aws_subnet.zzaeha_pub_a.id, aws_subnet.zzaeha_pub_c.id]

  tags = {
    "Name" = "zzaeha-alb"
  }
}

output "alb_dns" {
  value = aws_lb.zzaeha_alb.dns_name
}