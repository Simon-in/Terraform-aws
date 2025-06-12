terraform {
  backend "s3" {
    bucket = "terraform-backend-lin"
    key = "terraform-backend-lock"
    region = "ap-southeast-1"
    use_lockfile = true
  }
}