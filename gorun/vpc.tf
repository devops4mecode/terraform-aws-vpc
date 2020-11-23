provider "aws" {
  region = "ap-southeast-1"
}

module "s3" {
  source  = "devops4mecode/s3/aws"
  version = "1.1.0"

  name        = "log-bucket"
  application = "devops4me"
  environment = "test"
  label_order = ["environment", "application", "name"]



  versioning     = true
  acl            = "private"
  bucket_enabled = true
}

module "vpc" {
  source = "../"

  name        = "vpc"
  application = "devops"
  environment = "test"
  label_order = ["environment", "application", "name"]

  cidr_block = "10.0.0.0/16"

  enable_flow_log = true
  s3_bucket_arn   = module.s3_bucket.arn
}