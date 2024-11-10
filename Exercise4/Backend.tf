terraform {
  backend "s3" {
    bucket = "terraform-s3-sunloid"
    key = "bucket/terraform"
    region = "ap-south-1"
  }
}