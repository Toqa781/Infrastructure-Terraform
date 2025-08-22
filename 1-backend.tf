terraform {
  backend "s3" {
    bucket="statefile-bucket-2210"
    key="./terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "statefile-table"
  }
}