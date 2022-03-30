resource "aws_secretsmanager_secret" "this" {
  name          = "rts-labs"
  kms_key_id    = aws_kms_key.this.id
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode(tomap({"AWS_ACCESS_KEY_ID" = local.access_key, "AWS_SECRET_ACCESS_KEY" = local.secret_key}))
}
