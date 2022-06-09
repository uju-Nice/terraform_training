resource "aws_s3_bucket" "devops_bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }
}