terraform {
  backend "s3" {
    bucket         = "my-static-s3-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    use_lockfile   = true
    encrypt        = true
  }
}
