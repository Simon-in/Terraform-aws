/*
output "output_name" {
  description = 输出值的描述 可选
  value = 输出值 必填
  sensitive = 输出值是否敏感(true or false) 可选
}
*/

resource "aws_eip" "my_eip" {
  domain = "vpc"
}

output "eip" {
  description = "This is a public ip"
  value = aws_eip.my_eip.public_ip
  sensitive = true
}

