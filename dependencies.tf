# 显示依赖
resource "aws_instance" "my_ec2" {
  ami = "ami-0afc7fe9be84307e4"
  instance_type = "t2.micro"
  depends_on = [ aws_s3_bucket.my_s3 ]
}

resource "aws_s3_bucket" "my_s3" {
  bucket = "my-s3-bucket-lin"
}

# 隐式依赖
resource "aws_instance" "my_ec2" {
  ami = "ami-0afc7fe9be84307e4"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]
}

resource "aws_security_group" "my_sg" {
  name = "my_sg_p"
}