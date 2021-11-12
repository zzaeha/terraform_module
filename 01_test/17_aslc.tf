#Auto Scaling Launch Configuration
resource "aws_launch_configuration" "zzaeha_aslc" {
  name_prefix = "zzaeha-web-"
  image_id = aws_ami_from_instance.zzaeha_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups = [aws_security_group.zzaeha_sg.id]
  key_name = "zzaeha-key"

  #user_data = file("./install.sh")
/*
  lifecycle {
    create_before_destroy = true
  }
  */
}