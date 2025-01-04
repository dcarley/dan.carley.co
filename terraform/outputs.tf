output "cloudfront_dns" {
  value = "${aws_cloudfront_distribution.website.domain_name}"
}

output "deploy_key" {
  value = "${aws_iam_access_key.deploy.id}"
}

output "deploy_secret" {
  value = "${aws_iam_access_key.deploy.secret}"
  sensitive = true
}
