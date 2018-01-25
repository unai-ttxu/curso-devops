# Definir provider AWS
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "eu-west-3"
}

resource "aws_instance" "ubuntu" {
  ami = "ami-4262d53f"
  instance_type = "${var.instance_type_free}"
  key_name = "${var.key_name}"

  connection {
    user     = "ubuntu"
    private_key = "${file("/home/devops-udemy/.ssh/cursodevops.pem")}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nodejs",
    ]
  }

  provisioner "file" {
    source      = "src/server.js"
    destination = "/tmp/server.js"
  }

}

resource "aws_eip" "ubuntu_ip" {
  instance = "${aws_instance.ubuntu.id}"
}

resource "aws_instance" "linux_aws" {
  ami = "ami-8ee056f3"
  instance_type = "${var.instance_type_free}"
  key_name = "${var.key_name}"
}
