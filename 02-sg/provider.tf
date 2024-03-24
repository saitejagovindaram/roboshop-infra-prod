terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
  backend "s3" {
    bucket = "roboshop-state-prod"
    key = "sg"
    dynamodb_table = "roboshop-lock-prod"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}