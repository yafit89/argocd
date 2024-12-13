terraform {
  backend "s3" {
    bucket         = "yafit-cd"
    key            = "terraform/state/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
