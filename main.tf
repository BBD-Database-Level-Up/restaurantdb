provider "aws" {
  region     = var.aws_region  # Specify your desired AWS region
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

resource "aws_default_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]
}

resource "aws_default_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.available_zones.names[1]
}

resource "aws_db_instance" "restaurant_rds" {
  allocated_storage    = 20  # Specify the storage size in GB
  storage_type         = "gp2"  # Specify the storage type (e.g., gp2, standard)
  engine               = "sqlserver-ex"  # Specify the database engine (e.g., sqlserver-se, sqlserver-ee)
  engine_version       = "14.00.3381.3.v1"  # Specify the engine version
  instance_class       = "db.t2.micro"  # Specify the instance type (e.g., db.t2.micro, db.m4.large)
  identifier           = "restaurant-db-dev"
  username             = var.username  # Specify the username for the database
  password             = var.password  # Specify the password for the database
  parameter_group_name = "default.sqlserver-ex-14.0"  # Specify the parameter group name
  publicly_accessible  = true  # Set to true if you want the RDS instance to be publicly accessible

  tags                 = {
    created-using = "terraform"
    owner         = "ryan.blignaut@bbd.co.za"
  }
}


/*
# configured aws provider with proper credentials
provider "aws" {
  region     = var.aws_region  # Specify your desired AWS region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {

  tags = {
    Name = "default vpc"
  }
}


# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


# create a default subnet in the first az if one does not exit
resource "aws_default_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0]
}

# create a default subnet in the second az if one does not exit
#resource "aws_default_subnet" "subnet_az2" {
#  availability_zone = data.aws_availability_zones.available_zones.names[1]
#}

# create security group for the web server
resource "aws_security_group" "webserver_security_group" {
  name        = "webserver security group"
  description = "enable http access on port 80"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress = {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web server security group apparently we need thsi "
  }
}

# create security group for the database
resource "aws_security_group" "database_security_group" {
  name        = "database security group"
  description = "enable ms sql access on port 8888"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress = {
    description     = "mysql/aurora access"
    from_port       = 8888
    to_port         = 8888
    protocol        = "tcp"
    security_groups = [aws_security_group.webserver_security_group.id]
  }

  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "database security group"
  }
}


# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name        = "res_name"
  subnet_ids  = [aws_default_subnet.subnet_az1.id]
  description = "Subnets"
  tags        = {
    Name = "res_name"
  }
}

resource "aws_db_instance" "restaurant_rds" {
  allocated_storage      = 20  # Specify the storage size in GB
  storage_type           = "gp2"  # Specify the storage type (e.g., gp2, standard)
  engine                 = "sqlserver-ex"  # Specify the database engine (e.g., sqlserver-se, sqlserver-ee)
  engine_version         = "14.00.3381.3.v1"  # Specify the engine version
  instance_class         = "db.t2.micro"  # Specify the instance type (e.g., db.t2.micro, db.m4.large)
  db_name                = "restaurant"  # Specify the name for your RDS instance
  username               = var.username  # Specify the username for the database
  password               = var.password  # Specify the password for the database
  parameter_group_name   = "default.sqlserver-ex-14.0"  # Specify the parameter group name
  publicly_accessible    = true  # Set to true if you want the RDS instance to be publicly accessible
  multi_az               = false  # Set to true if you want a Multi-AZ deployment
  skip_final_snapshot    = true  # Set to true if you want to skip the final snapshot when deleting the RDS instance
  port                   = 8888
  db_subnet_group_name   = aws_security_group.database_security_group.name
  vpc_security_group_ids = [aws_security_group.database_security_group]
  availability_zone      = data.aws_availability_zones.available_zones.names[0]
  tags                   = {
    created-using = "terraform"
    owner         = "ryan.blignaut@bbd.co.za"
  }
}

*/
/*
# create the rds instance
resource "aws_db_instance" "db_instance" {
  engine = engine_version = multi_az = identifier = username = password = instance_class = allocated_storage =
  db_subnet_group_name                                                                   = vpc_security_group_ids =
  availability_zone                                                                      = db_name =
  skip_final_snapshot                                                                    =
}*/


