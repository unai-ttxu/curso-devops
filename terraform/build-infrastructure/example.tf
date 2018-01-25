provider "aws" {
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_secret_KEY"
  region     = "eu-west-3"
}

resource "aws_instance" "server" {
  ami           = "ami-4262d53f"
  instance_type = "t2.micro"
  key_name	= "test"
}
