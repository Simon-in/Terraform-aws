module "team_a" {
  source = "../ec2"
  ami = "ami-0afc7fe9be84307e4"
  instance_type = "t2.micro"
}

module "team_b" {
  source = "../ec2"
  ami = "ami-0afc7fe9be84307e4"
  instance_type = "t5.large"
}