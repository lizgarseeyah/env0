provider "aws" {
  access_key = "ACCESSKEY"
  secret_key = "SECRETKEY"
  version = "~> 2.0"
  region  = "us-east-1"
  assume_role {
      # The role ARN within Account B to AssumeRole into. Created in step 1.
      role_arn    = "arn:aws:iam::360655237190:role/assume-role-acct-b"
      session_name = "terraform"
      external_id = "my_external_id"
  }
}

resource "aws_s3_bucket" "env0" {
  bucket = "BUCKETNAME"

}
