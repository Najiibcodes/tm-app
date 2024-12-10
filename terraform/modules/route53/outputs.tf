output "hosted_zone_id" {
  description = "The ID of the hosted zone"
  value       = "Z054746681O6Z0K38AC7" 
}

output "dns_record_fqdn" {
  description = "The fully qualified domain name (FQDN) of the DNS record"
  value       = aws_route53_record.dns_record.fqdn
}
