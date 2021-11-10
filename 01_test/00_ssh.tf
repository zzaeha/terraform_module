resource "aws_key_pair" "zzaeha_key" {
  key_name = "zzaeha2-key"
//  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJUFvk7wY5Uj7P+6EOitTWEHHVIIHMAmX/xTvxM9v6eKLmqAqm3AN9BUUAoqyNbkXuUXr5rV90ZKfYqLengV+Do825E3ONqCfv+kf5JShDP6CVM9RUxEumzzQGPHChRMyfS3kwMmRf3SnuVK0y62hwsgFIfrOnq+u3bV4K7OPdX4A095zmhbcMAnvz6AWDFpKteNbw7K3bQvA2HbJgfCDNcGcSFbGrS+0Fyf72dsPipJE5SO+fgqwhw3efsYFgA4n9G0FT5mW6L8IGjA4DuGEZd4OPqyqplESZmUY1ZEb+b7hzA2bj+FGWTqjwh2LYmvqTxKu54A4kkRY+WOXO1IZZmQRbxYsFCoOjIQCHBzrPP25FNhVijCSJ/PDDBYR//ULu7mf5J5xSm20+us0gDQd0QVZSeC9cdjBbKNM3zjSCeuUGMLUTHyRoV9IwWY1PVSZEa/V9tFb0U/RGHJTib5x04RV/lpUgyXMAzit0ztqhzuh6KNxpvWueHa8wseIAl3s="
    public_key = file("../../.ssh/zzaeha-key.pub")
}