module "test" {
    source  =  "../01_test"

    name                 = "zzaeha"
    region               = "ap-northeast-2"
    avazone              = ["a","c"]
    key                  = "zzaeha-key"
    cidr                 = "0.0.0.0/0"
    cidr_v6              = "::/0"
    cidr_main            = "10.0.0.0/16"
    public_s             = ["10.0.0.0/24","10.0.2.0/24"]
    private_s            = ["10.0.1.0/24","10.0.3.0/24"]
    private_dbs          = ["10.0.4.0/24","10.0.5.0/24"]
    private_ip           = "10.0.0.11"
    intance              = "t2.micro"
    protocol_tcp         =  "tcp"
    protocol_udp         =  "udp"
    protocol_http        =  "http"
    protocol_http1       =  "HTTP"
    protocol_icmp        =  "icmp"
    protocol_ssh         =  "ssh"
    port_ssh             =  22
    port_http            =  80
    port_mysql           =  3306
    port_zero            =  0
    port_minus           =  -1 
    protocol_minus       =  "-1"
    db_name              =  "mydb"
    load_type            =  "application"
    strategy             =  "cluster"
    storage_size         =  20
    storage_type         =  "gp2"
    mysql_version        =  "8.0"
    sql_engine           =  "mysql"
    username             =  "admin"
    password             =  "It12345!"
    name_db              =  "mydb"
    instance_db          =  "db.t2.micro"
}
