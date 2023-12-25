packer {
    required_plugins {
        amazon = {
            version = ">= 1.0.0"
            source = "github.com/hashicorp/amazon"
        }
    }
}

locals {
    timestamp = regex_replace(timestamp(),"[- TZ:]","")
}

source "amazon-ebs" "webApp" {

    ami_name = "webAppCustomAMI-${local.timestamp}"

    source_ami_filter {
        filters = {
            name = "amzn2-ami-kernel-*.1-x86_64-gp2"
            root-device-type = "ebs"
            virtualization-type = "hvm"
        }
        most_recent = true
        owners = ["amazon"]
    }

    instance_type = "t2.micro"
    region = "ap-south-1"
    ssh_username = "ec2-user"
}

build {
    sources = [
        "source.amazon-ebs.webApp"
    ]

    provisioner "file" {
        source = "webapplication.zip"
        destination = "/home/ec2-user/webapplication.zip"
    }

    provisioner "file" {
        source = "./webapp.service"
        destination = "/tmp/webapp.service"
    }

    provisioner "shell" {
        script = "./webapp-ec2.sh"
    }
}