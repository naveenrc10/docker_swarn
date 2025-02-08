locals {
  servers =["DC-Leader","DC-Node1","DC-Node2"]
}

resource "aws_security_group" "DC_SG" {
    name = "allow_ssh" 
    description = "Security group to allow SSH access" 
    # Replace with your VPC ID 
    
    ingress { 
        from_port = 22 
        to_port = 22 
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere; use specific IPs or ranges for better security
    } 
    ingress {
        description = "Allow HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress { 
        from_port = 0
        to_port = 0
        protocol = "-1" 
        # Allows all outbound traffic 
        cidr_blocks = ["0.0.0.0/0"] 
    } 
}

resource "aws_instance" "DC_Cluster" {
  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  tags = {
    Name = each.value
  }
  for_each = toset(local.servers)
  key_name = "example"
  security_groups = [aws_security_group.DC_SG.name]
  user_data = base64encode(file("ec2Init.sh"))
}