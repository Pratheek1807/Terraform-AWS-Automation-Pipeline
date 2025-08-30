#1 vpc , 1 subnet , 1 security group 

#vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true #used for dns resolution
  enable_dns_hostnames = true #used for dns hostnames
  tags = {
    Name = "my_vpc"
  }
  }

#subnet 
  resource "aws_subnet" "pb_sn" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a" ##change to it 

    tags = {
      Name = "pb_sn"
    }
  }

#security group
    resource "aws_security_group" "sg" {
        name = "my_sg"
        description = "Allow SSH and HTTP"
        vpc_id = aws_vpc.my_vpc.id
    
        #inbound traffic
        ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

        #outbound traffic allowd from every port
        egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        }

    }