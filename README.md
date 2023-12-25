# AWS Cloud-Native Web Application with CI/CD Integration

This repository contains a 3-tiered AWS cloud-native web application, leveraging various AWS services to ensure scalability, security, and efficient deployment. The entire cloud stack is defined using AWS CloudFormation, providing infrastructure as code.

## Components

### Web Application

The web application is built using Node.js with the Express framework. Endpoints are created to handle various functionalities, and these endpoints are secured using JSON Web Tokens (JWT) for authentication.

### Hosting Environment

The application is hosted on EC2 instances within an Auto Scaling Group, managed by an Application Load Balancer (ALB). The entire infrastructure is set up in a custom Virtual Private Cloud (VPC) to control network access and security.

### Database

Amazon RDS is used as the relational database to store and manage data. This ensures a scalable and managed database solution for the application.

### AWS Services Integration

- **S3**: Amazon Simple Storage Service (S3) is utilized for storing and retrieving static assets, ensuring efficient handling of files and objects.

- **SNS**: Simple Notification Service (SNS) is integrated for event-driven communication and notifications within the application.

- **Lambda**: AWS Lambda functions are employed for serverless computing, allowing for event-triggered execution of code.

- **CodeDeploy**: CodeDeploy automates the deployment process, ensuring smooth and reliable updates to the application.

## Continuous Integration/Continuous Deployment (CI/CD)

### CI Workflow

1. **Build Process**: Upon every merge, the web application is built using the Node.js dependencies specified in the `packages.json` file.

2. **Testing**: The added tests are executed, and the status is checked to ensure all tests pass successfully.

### CD Workflow

3. **Deployment Initiation**: Deployment is triggered using Packer, which creates an Amazon Machine Image (AMI) containing the necessary files and dependencies.

4. **S3 Deployment**: The AMI is pushed to AWS S3, making it available for deployment.

5. **CodeDeploy Deployment**: A deployment is created in AWS CodeDeploy, which automates the deployment of the new version of the application to the EC2 instances.

## Setting Up the Environment

To set up the entire cloud stack, use the provided CloudFormation templates available in the [CloudFormation Stack](https://github.com/gautamvr/aws_infrastructure) repository.

## CI/CD Integration with GitHub Actions

The CI/CD pipeline is seamlessly integrated with GitHub Actions:

- **CI Trigger**: The CI process is triggered upon every merge to the main branch.

- **CD Trigger**: Upon successful completion of CI, the CD process is initiated, ensuring a smooth and automated deployment.

For detailed instructions and configurations, refer to the GitHub Actions workflow files in the repository.

This project provides a robust and scalable infrastructure for hosting a web application on AWS, coupled with an efficient CI/CD pipeline for seamless development and deployment.
