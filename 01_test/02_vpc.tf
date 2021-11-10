resource "aws_vpc" "zzaeha_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "zzaeha_vpc"
    }
  
}
