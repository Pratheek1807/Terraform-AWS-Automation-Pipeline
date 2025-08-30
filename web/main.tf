#ec2

resource "aws_instance" "server" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  subnet_id     = var.sn
  vpc_security_group_ids = [var.sg]
  key_name      = "key"


  tags = {
    Name = "myserver"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y nginx
              sudo systemctl start nginx
              sudo systemctl enable nginx
              echo "<h1>Welcome to the Web Server</h1>" | sudo tee /var/www/html/index.html
              EOF
}