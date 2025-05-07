variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default = "my-static-s3-bucket"
}

variable "bucket_region" {
    description = "my default bucket region"
    type = string
    default = "eu-west-2"
}
