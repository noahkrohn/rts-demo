resource "aws_iam_user" "this" {
  name        = "rts-labs"
  path        = "/"
}

resource "aws_iam_policy" "this" {
  name        = "AdministratorAccess"
  path        = "/"
  description = "Provides full access to AWS services and resources."
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Effect = "Allow"
            Action = "*"
            Resource = "*"
        }
    ]
  })
}

resource "aws_iam_group" "this" {
  name        = "SystemsAdministrators"
}

resource "aws_iam_group_policy_attachment" "this" {
  group       = aws_iam_group.this.name
  policy_arn  = aws_iam_policy.this.arn
}

resource "aws_iam_access_key" "this" {
  user    = aws_iam_user.this.name
}
