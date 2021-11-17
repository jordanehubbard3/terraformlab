provider "aws" {
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
  region     = "us-east-1"
}

resource "aws_instance" "terraform-example" {
  ami           = "ami-04ad2567c9e3d7893"
  instance_type = "t2.micro"
}
