provider "aws" {
  region  = var.aws_region
}

provider "archive" {}

data "archive_file" "archive-power-lambda" {
  type        = "zip"
  output_path = "./lambdas/power/archive.zip"
  source_file = "./lambdas/power/index.js"
}

data "archive_file" "archive-random-number-lambda" {
  type        = "zip"
  output_path = "./lambdas/random/archive.zip"
  source_file = "./lambdas/random/index.js"
}
