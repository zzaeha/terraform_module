#Application Load Balancer 생성
resource "aws_lb" "zzaeha_lb" {
  name = "${var.name}-alb"
  internal = false
  load_balancer_type = var.load_type
  security_groups = [aws_security_group.zzaeha_websg.id]
  subnets = [aws_subnet.zzaeha_pub[0].id, aws_subnet.zzaeha_pub[1].id]

  tags = {
    "Name" = "${var.name}-alb"
  }
}

#ALB Target Group 생성
resource "aws_lb_target_group" "zzaeha_lbtg" {
  name = "${var.name}-lbtg"
  port = var.port_http
  protocol = var.protocol_http1
  vpc_id = aws_vpc.zzaeha_vpc.id

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 5
    matcher = "200"
    path = "/health.html"
    port = "traffic-port"
    protocol = var.protocol_http1
    timeout = 2
    unhealthy_threshold = 2
  }
}

#ALB Listener 생성
resource "aws_lb_listener" "zzaeha_lblist" {
  load_balancer_arn = aws_lb.zzaeha_lb.arn
  port = var.port_http
  protocol = var.protocol_http1

default_action {
  type = "forward"
  target_group_arn = aws_lb_target_group.zzaeha_lbtg.arn
  }
}

#ALB Target group Attachment 지정
resource "aws_lb_target_group_attachment" "zzaeha_lbtg_att" {
  target_group_arn = aws_lb_target_group.zzaeha_lbtg.arn
  target_id = aws_instance.zzaeha_web.id
  port = var.port_http
}