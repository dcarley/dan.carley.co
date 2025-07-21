output "dns_zone" {
  value = <<EOF
@ 600 IN ALIAS ${aws_cloudfront_distribution.redirect.domain_name}
dan 600 IN CNAME ${aws_cloudfront_distribution.website.domain_name}
%{for cert in aws_acm_certificate.website.domain_validation_options~}
${replace(cert.resource_record_name, ".${cert.domain_name}.", "")} 600 IN ${cert.resource_record_type} ${cert.resource_record_value}
%{endfor~}
EOF
}

output "deploy_key" {
  value = aws_iam_access_key.deploy.id
}

output "deploy_secret" {
  value     = aws_iam_access_key.deploy.secret
  sensitive = true
}
