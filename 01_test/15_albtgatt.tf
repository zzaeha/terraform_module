#ALB Target group Attachement 지정
resource "aws_lb_target_group_attachment" "zzaeha_tgatt" {
  target_group_arn = aws_lb_target_group.zzaeha_albtg.arn
  target_id = aws_instance.zzaeha_web_a.id
  port = 80
}