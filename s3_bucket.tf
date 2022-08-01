module "adminconsole_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = join("", ["admin-console", data.aws_caller_identity.current.account_id])
  acl    = "private"


  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true

}