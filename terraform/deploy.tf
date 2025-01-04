resource "aws_iam_user" "deploy" {
  name = "${var.website_name}"
}

resource "aws_iam_access_key" "deploy" {
  user = aws_iam_user.deploy.name
}

data "aws_iam_policy_document" "deploy" {
  statement {
    effect    = "Allow"
    actions   = [
      "s3:ListAllMyBuckets",
      "s3:HeadBucket",
    ]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = [
      "arn:aws:s3:::dan.carley.co/*",
      "arn:aws:s3:::dan.carley.co"
    ]
  }
}

resource "aws_iam_user_policy" "deploy" {
  name   = "${var.website_name}"
  user   = aws_iam_user.deploy.name
  policy = data.aws_iam_policy_document.deploy.json
}
