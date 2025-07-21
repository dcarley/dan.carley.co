resource "aws_acm_certificate" "website" {
  domain_name               = var.website_name
  validation_method         = "DNS"
  subject_alternative_names = [var.domain_name]
  provider                  = aws.us-east
}
