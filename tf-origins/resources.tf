#directive for remote-state-file storage for terraform (for non-module structure)
terraform {
  backend "s3" {
    bucket="bucket-from-lambda-skiff"
    key = "localstack_test/terraform.tfstate"
    region = "us-east-1"
  }
}


variable vpc_cidr_mask16 {
    description = "First two numbers of the VPC (without dot in the end)"
    type = string
    default = "10.173"
}

locals {
  vpc_cidr = "${var.vpc_cidr_mask16}.0.0/16"
}

resource "aws_vpc" "skiff_vpc" {
    cidr_block = local.vpc_cidr
    tags = {
        Name = "${var.vpc_cidr_mask16}.x.x-skiff-delete"
    }
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "delete-test-skiff-bucket"
}