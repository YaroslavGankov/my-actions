#if this file was changed then 'terraform init' will execute....
#next comment
#second comment
#third comment
#4 comment

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}


provider "aws" {
  endpoints {
    s3             = "http://s3.localhost.localstack.cloud:4566"
  }
}
