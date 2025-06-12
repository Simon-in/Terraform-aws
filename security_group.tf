/* resources格式  
resource resource_type resource_name {
   资源参数
}
*/
resource "aws_security_group" "my_sg" {
  name = "my_sg"
}

/* 属性引用格式
  resource_type.resource_name.attribute
*/
resource "aws_eip" "my_eip" {
  domain = "vpc"
}

resource "aws_vpc_security_group_ingress_rule" "my_sg_igress_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4 = "${aws_eip.my_eip.public_ip}/32"
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80
}

output "eip_public_ip" {
  value = aws_eip.my_eip.public_ip
}

output "igress_cidr_ipv4" {
  value = aws_vpc_security_group_ingress_rule.my_sg_igress_ipv4.cidr_ipv4
}

# 出站规则可以删除不建
resource "aws_vpc_security_group_egress_rule" "my_sg_egress_ipv4" {
  security_group_id = aws_security_group.my_sg.id
  cidr_ipv4 = "${aws_eip.my_eip.public_ip}/32"
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80
}