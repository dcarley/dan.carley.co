data "aws_iam_policy_document" "website" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${var.website_name}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.website_name}"
}

resource "aws_s3_bucket_acl" "website" {
  bucket = "${aws_s3_bucket.website.bucket}"
  acl    = "private"
}

resource "aws_s3_bucket_policy" "website" {
  bucket = "${aws_s3_bucket.website.bucket}"
  policy = "${data.aws_iam_policy_document.website.json}"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = "${aws_s3_bucket.website.bucket}"
  index_document {
    suffix = "index.html"
  }
}
