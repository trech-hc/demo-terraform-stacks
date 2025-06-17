output "lambda_urls" {
  type        = list(string)
  description = "URLs to invoke lambda functions"
  value       = [for x in component.lambda : x.invoke_arn]
}
output "hello_urls" {
  type        = list(string)
  description = "URLs for invoking our Lambda functions"
  value       = [for x in component.api_gateway : x.invoke_url]
}
