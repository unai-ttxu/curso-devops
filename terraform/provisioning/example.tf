# Configure the AWS Provider
provider "aws" {
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
  region     = "eu-west-3"
}

# Create a web server
resource "aws_instance" "server" {
  ami = "ami-4262d53f"
  instance_type = "t2.micro"
  key_name = "cursodevops"

  connection {
    user     = "ubuntu"
    private_key  = "${file("/home/devops-udemy/.ssh/cursodevops.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nodejs",
    ]
  }
}
