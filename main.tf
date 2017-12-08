provider "aws" {
  version = "~> 1.5"
  region  = "ap-southeast-1"
}

provider "null" {
  version = "~> 1.0"
}

resource "null_resource" "example" {}

resource "aws_instance" "web" {
  ami           = "ami-032fb460"
  instance_type = "t2.micro"
}

module "s3bucket" {
  source        = "git@github.com:honestbee/tf-modules.git?ref=master//aws/bucket"
  namespace     = "honestbee"
  stage         = "staging"
  name          = "atlantis-test"
  access        = "private"
  force_destroy = false
  region        = "ap-southeast-1"
}
