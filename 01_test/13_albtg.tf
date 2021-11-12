#ALB Target Group 생성
resource "aws_lb_target_group" "zzaeha_albtg" {
  name = "zzaeha-albtg"
  port = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = aws_vpc.zzaeha_vpc.id

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path = "/index.html"
    port = "traffic-port"
    timeout = 2
    unhealthy_threshold = 2
  }
}