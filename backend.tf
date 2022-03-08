terraform {
  backend "s3" {
    region          = "us-east-1"
    bucket          = "rtslab-demo-tfstate"
    key             = "terraform.tfstate"
    dynamodb_table  = "tfstate-lock"
  }
}
