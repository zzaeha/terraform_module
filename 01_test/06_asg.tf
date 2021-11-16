#AMI 생성
resource "aws_ami_from_instance" "zzaeha_ami" {
  name = "${var.name}-ami"
  source_instance_id = aws_instance.zzaeha_web.id
  #meta-argument 선언
  depends_on = [
    aws_instance.zzaeha_web
  ]
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "${var.name}-ami"
  }
}

#Auto Scaling Launch Configuration
resource "aws_launch_configuration" "zzaeha_aslc" {
  name = "${var.name}-web"
  image_id = aws_ami_from_instance.zzaeha_ami.id
  instance_type = var.instance
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.zzaeha_websg.id]
  key_name = var.key
  user_data = <<-EOF
                #! /bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF

  lifecycle {
    create_before_destroy = true
  }
}

#Placement
resource "aws_placement_group" "zzaeha_pg" {
  name = "${var.name}-pg"
  strategy = var.strategy
}

#Auto Scaling Group 생성
resource "aws_autoscaling_group" "zzaeha_asg" {
  name = "${var.name}-asg"
  min_size = 2
  max_size = 8
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.zzaeha_aslc.name
  vpc_zone_identifier = [aws_subnet.zzaeha_pub[0].id, aws_subnet.zzaeha_pub[1].id]

}

#Auto Scaling Group ALB Attachment
resource "aws_autoscaling_attachment" "zzaeha_asgatt" {
  autoscaling_group_name = aws_autoscaling_group.zzaeha_asg.id
  alb_target_group_arn = aws_lb_target_group.zzaeha_lbtg.arn
}
