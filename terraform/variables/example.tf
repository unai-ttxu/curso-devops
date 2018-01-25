provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-west-3"
}

resource "aws_instance" "server" {
  ami           = "${var.my-ami}"
  instance_type = "t2.micro"
  key_name	= "test"
}
