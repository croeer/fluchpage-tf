output "cloudfront_distribution_domain_name" {
  description = "The CloudFront distributions domain name"
  value       = module.client_homepage_spa.cloudfront_distribution.domain_name
}
