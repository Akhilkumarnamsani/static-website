terraform {
  backend "s3" {
    bucket         = "akil-s3-static-site-test-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    use_lockfile   = true
    encrypt        = true
  }
}
