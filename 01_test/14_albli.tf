#ALB Listener 생성
resource "aws_lb_listener" "zzaeha_albli" {
  load_balancer_arn = aws_lb.zzaeha_alb.arn
  port = 80
  protocol = "HTTP"

default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.zzaeha_albtg.arn
  }
}