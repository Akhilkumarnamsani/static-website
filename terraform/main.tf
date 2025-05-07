provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  #acl    = "public-read"

  website {
    index_document = "index.html"
  }

  tags = {
    Name = "StaticSiteBucket"
  }
}

resource "aws_s3_bucket_public_access_block" "static_site" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.static_site.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.static_site.bucket
  key    = "index.html"
  source = "../website/index.html"
  acl    = "public-read"
  content_type = "text/html"
}
