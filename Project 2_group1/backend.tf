terraform {
  backend "s3" {
    bucket         = "our-bucket-name"
    key            = "ohio/terraform.tfstate"
    region         = "us-east-2"
    }
}