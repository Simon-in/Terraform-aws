# condition ? true_val : false_val

variable "development" {
  default = "development"
}

variable "region" {
  default = "ap-southeast-1"
}

resource "aws_instance" "my_ec2" {
  ami = "1234"
  instance_type = var.development == "development" && var.region == "ap-southeast-1" ? "t2.micro" : "t5.large"
}