#Security Group 생성
resource "aws_security_group" "zzaeha_websg"{
  name = "Allow-Web"
  description = "http-ssh-icmp"
  vpc_id = aws_vpc.zzaeha_vpc.id

  #inbound 규칙
  ingress = [
    {
      description = var.protocol_http
      from_port = var.port_http
      to_port = var.port_http
      protocol = var.protocol_tcp
      cidr_blocks = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null
    },
    {
      description = var.protocol_ssh
      from_port = var.port_ssh
      to_port = var.port_ssh
      protocol = "tcp"
      cidr_blocks = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null
    },
    {
      description = var.db_name
      from_port = var.port_mysql
      to_port = var.port_mysql
      protocol = var.protocol_tcp
      cidr_blocks = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null
    },
    {
      description = var.protocol_icmp
      from_port = var.port_minus
      to_port = var.port_minus
      protocol = var.protocol_icmp
      cidr_blocks = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
  #outbound 규칙
  egress = [
    {
      description = "ALL"
      from_port = var.port_zero
      to_port = var.port_zero
      protocol = var.protocol_minus
      cidr_blocks = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
  tags = {
    "Name" = "${var.name}-sg"
  }
}

#ami 가져오기
data "aws_ami" "amzn" {
  most_recent = true

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

#EC2 Instance 생성
#resource
resource "aws_instance" "zzaeha_web"{
  ami = data.aws_ami.amzn.id
  instance_type = var.instance
  key_name = var.key
  availability_zone = "${var.region}${var.ava[0]}"
  # private_ip = var.pri_ip
  subnet_id = aws_subnet.zzaeha_pub[0].id
  vpc_security_group_ids = [aws_security_group.zzaeha_websg.id]
  user_data = file("./install.sh")
}

#eip
resource "aws_eip" "zzaeha_web_eip" {
  vpc = true
  instance = aws_instance.zzaeha_web.id
  # associate_with_private_ip = var.pri_ip
  depends_on = [
    aws_internet_gateway.zzaeha_ig
  ]
}