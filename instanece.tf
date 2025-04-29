data "aws_vpc" "default" {
  default = true
}

# List all subnets in the default VPC
data "aws_subnets" "all_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Get a specific subnet by ID if needed
data "aws_subnet" "specific_subnet" {
  id = ""  #default subnet id
    # Use your actual subnet ID here
}

# Reference existing security group by ID
data "aws_security_group" "existing_sg" {
  id = "" #default sg id
}

# Use existing public key
resource "aws_key_pair" "my_key_pair" {
  key_name   = "test"
  public_key = file("test.pub")
}

# Launch EC2 instance
resource "aws_instance" "my_instance" {
  ami                    = "ami-0e35ddab05955cf57" #ubuntu image
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnet.specific_subnet.id  # Use the specific subnet ID

  key_name               = aws_key_pair.my_key_pair.key_name
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]


  tags = {
    Name = "MyInstance"
  }
}