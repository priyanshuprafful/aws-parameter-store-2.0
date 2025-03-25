terraform {
  backend "s3" {
    bucket = "terraform-roboshop-statefile-bucket"
    key = "parameters/terraform.tfstate"
    region = "us-east-1"
  }
}
