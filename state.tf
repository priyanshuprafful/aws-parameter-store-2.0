terraform {
  backend "s3" {
    bucket = "terraform-b73-prafful"
    key = "params/terraform.tfstate"
    region = "us-east-1"
  }
}

