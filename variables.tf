variable "app_name" {
  description = "The name of the application."
  type        = string
  default     = "fluchpage"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central1"
}

variable "aws_account_id" {
  description = "AWS account ID"
  type        = string
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate for the API Gateway custom domain (us-east-1)."
  type        = string
  default     = ""
}

variable "custom_domain_names" {
  description = "The custom domain name for the API Gateway."
  type        = list(string)
  default     = []
}

variable "google_api_key" {
  description = "The API key for the Google gemini API."
  type        = string
}

variable "fluch_prompt" {
  description = "The prompt for the Fluch."
  type        = string
}
