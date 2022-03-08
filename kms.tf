resource "aws_kms_key" "this" {
  description             = "RTS Labs KMS Key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "this" {
  name          = "alias/rts-labs-demo"
  target_key_id = aws_kms_key.this.key_id
}
