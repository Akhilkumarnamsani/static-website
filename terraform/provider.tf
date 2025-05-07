terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.7.4"
    }
  }
}

provider "aws" {
  region  = var.bucket_region
}
