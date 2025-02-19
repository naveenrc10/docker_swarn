locals {
  servers =["DC-Leader","DC-Node1","DC-Node2"]
}
resource "aws_key_pair" "dc_key" {
  key_name = "dc_key"
  public_key = file("dc_key.pub")
  
}

resource "aws_security_group" "DC_SG" {
    name = "allow_ssh" 
    description = "Security group to allow SSH access" 
    # Replace with your VPC ID 
  ingress {
        description = "Allow All"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
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
  instance_type = "t2.small"
  tags = {
    Name = each.value
    App="docker_swarm"
  }
  for_each = toset(local.servers)
  key_name = aws_key_pair.dc_key.key_name
  security_groups = [aws_security_group.DC_SG.name]
  user_data = base64encode(file("ec2Init.sh"))
}