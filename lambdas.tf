resource "aws_iam_role" "iam_for_lambda" {
  name = "lambdaIAM"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


module "random_lambda" {
  source = "./modules/lambda"

  filename            = "./lambdas/random/archive.zip"
  function_name       = "random_lambda"
  lambda_iam_role_arn = aws_iam_role.iam_for_lambda
}

module "power_lambda" {
  source = "./modules/lambda"

  filename            = "./lambdas/power/archive.zip"
  function_name       = "power_lambda"
  lambda_iam_role_arn = aws_iam_role.iam_for_lambda
}
