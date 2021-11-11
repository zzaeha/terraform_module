/*
#ami 가져오기
data "aws_ami" "amzn" {
  most_recent = 

  filter{
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
*/

#EC2 Instance 생성
#resource
resource "aws_instance" "zzaeha_web_a"{
  ami = "ami-04e8dfc09b22389ad"   //Amazon Linux 2 ami data값
  instance_type = "t2.micro"
  key_name = "zzaeha-key"
  availability_zone = "ap-northeast-2a"
  private_ip = "10.0.0.11"
  subnet_id = aws_subnet.zzaeha_pub_a.id
  vpc_security_group_ids = [aws_security_group.zzaeha_sg.id]
  user_data = <<-EOF
                #!/bin/bash
                sudo su -
                yum install -y httpd
                echo "ZZAEHA-Terraform-1" >> /var/www/html/index.html
                systemctl start httpd
                EOF
}
#eip
resource "aws_eip" "zzaeha_web_a_ip" {
  vpc = true
  instance = aws_instance.zzaeha_web_a.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.zzaeha_ig
  ]
}