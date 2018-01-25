# Configure the AWS Provider
provider "aws" {
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
  region     = "eu-west-3"
}

# Create a web server
resource "aws_instance" "webserver" {
  ami = "ami-4262d53f"
  instance_type = "t2.micro"
  key_name = "cursodevops"
}

# Create elastic ip for web server
resource "aws_eip" "myeip" {
  instance = "${aws_instance.webserver.id}"
}
