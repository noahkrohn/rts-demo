resource "aws_s3_bucket" "this" {
  bucket                  = "rtslab-demo-tfstate"
  acl                     = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "alias/rts-labs-demo"
      }
    }
  }
}
