#if this file was changed then 'terraform init' will execute....
#next comment
#second comment

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}


provider "aws" {}
