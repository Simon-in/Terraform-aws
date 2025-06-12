# 根据Workspace动态设置变量
locals {
  env_settings = {
    dev = {
      instance_type = "t2.micro"
      instance_count = 1
    }
    prod = {
      instance_type = "m5.large"
      instance_count = 3
    }
  }
  
  current = local.env_settings[terraform.workspace]
}

resource "aws_instance" "web" {
  ami = "ami-0afc7fe9be84307e4"
  count         = local.current.instance_count
  instance_type = local.current.instance_type
  tags = {
    Environment = terraform.workspace  # 自动标记环境
  }
}