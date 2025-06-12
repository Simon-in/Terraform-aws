resource "aws_instance" "my_ec2_3" {
  ami = "ami-0afc7fe9be84307e4"
  instance_type = "t2.micro"
  tags = {
    Name = "my_ec2_${count.index}"
  }
  count = 3
}

resource "aws_iam_user" "my_iam" {
#   name = "terraform.${count.index}"
  name = var.developmentname[count.index]
  count = 3
}

variable "developmentname" {
  type = list(string)
  default = [ "Alice","Bob","Simon"]
}