provider "aws" {
  region = var.aws_region
}

module "s3_website" {
  source = "./modules/s3_website"

  domain_name    = var.domain_name
  subdomain_name = var.subdomain_name
  bucket_name    = var.s3_bucket_name
  index_document = var.index_document
  error_document = var.error_document
}

resource "aws_s3_bucket_object" "my-bucket-anna" {
  depends_on = [aws_s3_bucket.example]
  bucket = aws_s3_bucket.static_site.bucket #“project1”
  acl    = "public-read"
  key    = “index.html”
  source = “index.html”
}
resource "aws_s3_bucket_object" "error" {
  depends_on = [aws_s3_bucket.example]
  bucket = aws_s3_bucket.static_site.bucket #“project1”
  key    = “error.html”
  source = “error.html”
  acl    = "public-read"
}

# resource "aws_route53_record" "www" {
#   zone_id = var.route53_zone_id
#   name    = "${var.subdomain}.${var.domain_name}"
#   type    = "A"
#   alias {
#     name                   = aws_s3_bucket.static_site.website_endpoint
#     zone_id                = aws_s3_bucket.static_site.hosted_zone_id
#     evaluate_target_health = true
#   }
# }

resource "aws_route53_record" "www" {
  zone_id = "Z058810638W6QJ42UREE5"
  name = "bbb.alex-aws.com"
  type = "CNAME"
  ttl = 300
  records = ["${aws_s3_bucket.my-bucket-anna.bucket}.s3-website-us-east-1.amazonaws.com"]
}

resource "aws_s3_bucket" "menu_images" {
  bucket = "my-restaurant-menu-images"
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my-bucket-anna.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.my-bucket-alex.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.my-bucket-anna.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
    }
    
    depends_on = [ aws_s3_bucket_acl.example ]
  
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my-bucket-anna.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


output "website_url" {
  value = aws_s3_bucket.static_site.website_endpoint
}