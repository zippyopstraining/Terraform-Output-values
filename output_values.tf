provider "aws" {
        region  = "us-east-1"
        access_key = "Your_access_key"
        secret_key = "Your_secret_key"
}

resource "aws_vpc" "main" {
    cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "web" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.1.0.0/16"
}

resource "aws_instance" "web" {
        ami           = "ami-042e8287309f5df03"
        instance_type = "t2.micro"

        tags = {
                Name = "output Test"
        }
}

output "instance" {
        value = aws_instance.web
        description = "Web instance"
        sensitive = true
}

output "public_ip" {
        value = aws_instance.web.public_ip
}
