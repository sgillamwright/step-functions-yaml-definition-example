// Create AWS Lambda function
resource "aws_lambda_function" "lambda" {
  filename         = var.filename
  function_name    = var.function_name
  role             = var.lambda_iam_role_arn.arn
  handler          = "index.handler"
  runtime          = "nodejs14.x"
}