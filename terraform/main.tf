provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  tags = {
    Name = "StaticSiteBucket"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.static_site.bucket
  key    = "index.html"
  source = "../website/index.html"
  acl    = "public-read"
  content_type = "text/html"
}
