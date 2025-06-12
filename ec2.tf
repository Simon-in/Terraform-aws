
resource "aws_instance" "my_ec2" {
  ami = "ami-0afc7fe9be84307e4"
  instance_type = "t2.micro"
  tags = {
    Name = "my_ec2"
  }
}
