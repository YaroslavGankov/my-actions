#if this file was changed then 'terraform init' will execute....
#next comment
#second comment
#third comment
#4 comment

provider "aws" {
  default_tags {
    tags = {
      Learning = "Terraform TEG"
      Owner = "yaroslav.gankov"
      Creator = "yaroslav.gankov"
    }
  }
}
