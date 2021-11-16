module "test1" {
  source = "../01_test"

   # vpc_id  = aws_vpc.zzaeha_vpc.id
    region  = "ap-northeast-3"
    cidr    = "10.2.0.0/16"
    zone    = ["a", "c"]
    public_subnets   = ["10.2.0.0/24", "10.2.2.0/24"]
    private_subnets  = ["10.2.1.0/24", "10.2.3.0/24"]
    private_ips        = ["10.2.0.11", "10.2.2.11"]
    name             =  "zzaeha"
    cidr_r            = "0.0.0.0/0"
    cidr_6r           = "::/0"
    protocol          = "tcp"
    protocol_h        = "HTTP"
    http_port         = 80
    ssh_port          = 22
    all_port          = 0
    ami               = "ami-0791d2e614355a9eb"
    instance          = "t3.nano"
    key               = "zzaeha-key"
    loadtype          = "application"
    actiontype        = "forward"
    instance_pro      = "admin_role"

}