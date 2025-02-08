terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    null ={
      source = "hashicorp/null"
      version = "3.1.0"
    }
  }
  
}

provider "aws" {
  region = "us-east-1"
}