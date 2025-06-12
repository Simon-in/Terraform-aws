/*
variable "variable_name" {
 type = 变量类型
 description = 变量描述
 default = 默认值 
 sensitive = 变量是否对安全敏感(true or false)
 validation {
   变量值的验证规则
 }
}
*/
variable "vpn-ip" {
    type = string
    description = "This is a ip"
    default = "127.6.8.9/32"
    sensitive = true
    validation {
    condition     = length(var.vpn-ip) > 4
    error_message = "The vpc name must be longer than 4 characters."
  }
}

/* 变量的设置方式
.tfvars 文件（推荐）
 terraform apply -var-file my-vars.tfvars

CLI 选项
 terraform apply -var vpc_cidr_block=“172.16.0.0/16”

环境变量
 export TF_VAR_vpc_dicr_block=“172.16.0.0/16”
 terraform apply

默认的变量文件 terraform.tfvars
 terraform apply
*/


resource "aws_security_group" "my_sg" {
  name = "my_sg"
}

resource "aws_vpc_security_group_egress_rule" "my_sg_egress_tcp_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4 = var.vpn_ip
  from_port = var.port.tcp
  ip_protocol = "tcp"
  to_port = var.port.tcp
}

resource "aws_vpc_security_group_egress_rule" "my_sg_egress_custom_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4 = var.vpn_ip
  from_port = var.port.custom
  ip_protocol = "custom"
  to_port = var.port.custom
}

resource "aws_vpc_security_group_egress_rule" "my_sg_egress_ssh_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = var.port.ssh
  ip_protocol = "ssh"
  to_port = var.port.ssh
}

variable "vpn_ip" {
    type = string 
    default = "127.6.8.9/32"
}

variable "port" {
    type = map
    default = {
        ssh = 22
        tcp = 80
        custom = 443
    }
}

# .tfvars
variable "vpn_ip" {}