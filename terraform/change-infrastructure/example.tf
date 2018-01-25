provider "aws" {
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
  region     = "eu-west-3"
}

resource "aws_instance" "server" {
  ami           = "ami-8965d2f4"
  instance_type = "t2.micro"
  key_name	= "test"
}
