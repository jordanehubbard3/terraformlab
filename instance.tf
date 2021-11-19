provider "aws" {
  access_key =  ""
  secret_key =  ""
  region     = "us-east-1"
}

#creating security group, allow ssh and http

resource "aws_security_group" "hello-terra-ssh-http" {
  name       = "hello-terra-http-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# Security Group ends here

#Creating aws ec2 instance

resource "aws_instance" "terraform-example" {
  ami              = "ami-04ad2567c9e3d7893"
  availability_zone = "us-east-1a"
  security_groups  = ["${aws_security_group.hello-terra-ssh-http.name}"]
  instance_type    = "t2.micro"
  key_name         = "terraform"
  user_data        = <<-EOF
  #! /bin/bash
  sudo yum install httpd -y
  sudo systemctl start httpd
  sudo systemctl enable httpd
  echo "<h1>Sample webserver created using terraform<br>Jordan Hubbard</h1>" >> /var/www/html/index.html
  EOF
}
