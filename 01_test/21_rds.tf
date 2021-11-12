#RDS생성
resource "aws_db_instance" "zzaeha_rds" {
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "8.0"
  instance_class = "db.t2.micro"
  name = "test"
  identifier = "test"
  username = "admin"
  password = "It12345!"
  parameter_group_name = "default.mysql8.0"
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.zzaeha_dbsb.id
  vpc_security_group_ids = [aws_security_group.zzaeha_sg.id]
  skip_final_snapshot = true
  
  tags = {
    "Name" = "zzaeha-rds"
  }
}

resource "aws_db_subnet_group" "zzaeha_dbsb" {
  name = "zzaeha-dbsb-group"
  subnet_ids = [aws_subnet.zzaeha_pri_dba.id,aws_subnet.zzaeha_pri_dbc.id]
  tags = {
    "Name" = "zzaeha-dbsb-gp"
  }
}