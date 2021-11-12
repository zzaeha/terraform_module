#AMI 생성
resource "aws_ami_from_instance" "zzaeha_ami" {
  name = "zzaeha-aws-ami"
  source_instance_id = aws_instance.zzaeha_web_a.id

  #meta-argument 선언
  depends_on = [
    aws_instance.zzaeha_web_a
  ]

  tags = {
    "Name" = "zzaeha-ami"
  }
}