#Auto Scaling Group 생성
resource "aws_autoscaling_group" "zzaeha_asg" {
  name = "zzaeha-asg"
  min_size = 2
  max_size = 10
  health_check_grace_period = 10
  health_check_type = "EC2"
  desired_capacity = 2
  force_delete = true
  launch_configuration = aws_launch_configuration.zzaeha_aslc.name
  vpc_zone_identifier = [aws_subnet.zzaeha_pub_a.id, aws_subnet.zzaeha_pub_c.id]

}