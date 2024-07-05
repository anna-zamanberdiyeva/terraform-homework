# Add S3 buckets

resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-anna"
}
resource "aws_s3_bucket" "bucket2" {
  bucket_prefix = "kaizen-"
}

# Import AWS buckets
# terraform import aws_s3_bucket.bucket3 my-bucket-az
# terraform import aws_s3_bucket.bucket4 my-bucket-az2

resource "aws_s3_bucket" "bucket3" {
  bucket = "my-bucket-az"
}

resource "aws_s3_bucket" "bucket4" {
  bucket = "my-bucket-az2"
}
