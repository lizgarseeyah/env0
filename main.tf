provider "aws" {
  access_key = "ACCESSKEY"
  secret_key = "SECRETKEY"
  version = "~> 2.0"
  region  = "us-east-1"
  assume_role {
      role_arn    = "arn:aws:iam::768631217593:role/env0-service-role"
      session_name = "terraform"
  }
}



resource "aws_s3_bucket" "env0" {
  bucket = "BUCKETNAME"

}

provider "random" {}

resource "random_string" "random" {
  length = "16"
  special = "false"
  min_lower = "16"
}

resource "aws_s3_bucket" "takehometask_bucket" {
  bucket = "env0-s3-${random_string.random.result}"
  acl    = "public-read"
  force_destroy = true
}
