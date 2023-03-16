terraform {
  backend "s3" {
    bucket = "s3roland007"
    dynamodb_table = "state-lock"
    key = "global/statefile/terraform.tfstate"
    region = "us-east-2"
    encrypt = true
    
  }

}


