provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "default_vpc"
  }
}

data "aws_availability_zones" "available_zones" {

}

resource "aws_default_subnet" "subnet_availability_z1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]
}

resource "aws_default_subnet" "subnet_availability_z2" {
  availability_zone = data.aws_availability_zones.available_zones.names[1]
}

resource "aws_security_group" "mssql_security_access" {
  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    created-using = "terraform"
    owner         = "ryan.blignaut@bbd.co.za"
  }
}


resource "aws_db_instance" "restaurant_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "sqlserver-ex"
  engine_version       = "14.00.3381.3.v1"
  instance_class       = "db.t2.micro"
  identifier           = "restaurant-db"
  username             = var.username
  password             = var.password
  parameter_group_name = "default.sqlserver-ex-14.0"
  publicly_accessible  = true
  skip_final_snapshot    = true

  tags = {
    created-using = "terraform"
    owner         = "ryan.blignaut@bbd.co.za"
  }
}
output "ip" {
  value = aws_db_instance.restaurant_rds.address
}