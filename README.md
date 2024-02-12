# Setting Up the Working Restaurant Database from Scratch

This guide will walk you through the process of setting up a relational database on AWS cloud, using Terraform for infrastructure deployment, Flyway for database change management, and automating the deployment process for continuous integration and continuous deployment (CI/CD). The database is designed to allow restaurants to keep track of waiters, orders, and popular meals.

## Requirements

- AWS Account
- Terraform installed on your local machine
- Flyway installed on your local machine
- Basic knowledge of AWS services, Terraform, and Flyway
- Access to the provided Entity-Relationship Diagram (ERD) diagram for reference
  ![restaurant database model](/restuarant.drawio.png)

## Steps

### 1. AWS Setup

1. Log in to your AWS Management Console.
2. Create an IAM user with appropriate permissions for Terraform to access AWS services.
3. Obtain the Access Key ID and Secret Access Key for the IAM user.

### 2. Terraform Configuration

1. Clone the repository containing Terraform configurations for the database setup.
2. Navigate to the Terraform directory.
3. Configure the `terraform.tfvars` file with your AWS credentials.
4. Review and modify the `main.tf` file to specify AWS resources like VPC, subnet, security groups, and RDS instance according to your requirements.
5. Run `terraform init` to initialize the Terraform configuration.
6. Run `terraform plan` to review the planned infrastructure changes.
7. If everything looks correct, run `terraform apply` to deploy the infrastructure on AWS.

### 3. Database Schema Initialization

1. Once the infrastructure is deployed, obtain the endpoint and credentials for the RDS instance from the Terraform output.
2. Connect to the RDS instance using a SQL client.
3. Execute the SQL scripts provided in the Flyway migrations folder to initialize the database schema based on the provided ERD diagram.

### 4. Flyway Setup

1. Install Flyway CLI on your local machine.
2. Configure Flyway with the database endpoint, credentials, and migration scripts location.
3. Run Flyway migrations using the `flyway migrate` command to apply database changes.

### 5. CI/CD Automation

1. Integrate the Terraform and Flyway setup into your CI/CD pipeline: GitHub Actions.
2. Automate the process of deploying infrastructure changes using Terraform and applying database changes using Flyway.
3. Set up triggers to initiate the CI/CD pipeline on code commits to the main branch.

## Maintenance

- Regularly update Terraform configurations and Flyway migration scripts to reflect changes in the database schema.
- Monitor the AWS infrastructure for any issues and scale resources as needed.
- Backup the database regularly to prevent data loss.

## Conclusion

By following this guide, you should now have a fully functional relational database deployed on AWS cloud, with infrastructure managed using Terraform, database changes managed using Flyway, and automation for CI/CD. This database will help restaurants keep track of waiters, orders, and popular meals efficiently.
