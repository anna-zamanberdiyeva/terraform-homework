variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
}

variable "subdomain_name" {
  description = "Subdomain name for the website"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}

variable "index_document" {
  description = "Filename of the index document"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "Filename of the error document"
  type        = string
  default     = "error.html"
}
variable "port" {
  type = list
}

variable "route53_zone_id" {
  description = "Route53 Hosted Zone ID"
  type        = string 
}