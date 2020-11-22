terraform {
  backend "s3" {
    bucket = "my_bucket_name"
    key = "backend/status"
    region = "us-east-2"
    encrypt = true
    kms_key_id = "arn:aws:kms:us-east-2:123456789:key/23453456kfi-2456fg-sdf455g"
  }
}