# 读取云平台现有资源
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

resource "aws_s3_bucket" "my_s3" {
  bucket = "my-s3-${data.aws_caller_identity.current.id}"
}


# 读取本地资源
data "local_file" "foo" {
  filename = "${path.module}/demo.txt"
}

output "local_file" {
  value = data.local_file.foo
}