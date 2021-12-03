provider "aws" {
  access_key =  var.access
  secret_key =  var.secret
  region = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.s3_bucket_name
  acl    = "private"

  tags = {
    Name         = "jordansdemobucket"
    Environment  = "Dev"
  }
}
