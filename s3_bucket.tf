resource "aws_s3_bucket" "adminconsole" {
  bucket = join("", ["admin-console", data.aws_caller_identity.current.account_id])

#   tags = var.common_tags
}


resource "aws_s3_bucket_acl" "adminconsole" {
  bucket = aws_s3_bucket.adminconsole.id
  acl    = "private"
}