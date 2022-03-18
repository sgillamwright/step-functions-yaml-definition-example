resource "aws_iam_role" "iam_for_step_functions" {
  name = "stepFunctionSampleStepFunctionExecutionIAM"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "states.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "policy_invoke_lambda" {
  name = "stepFunctionSampleLambdaFunctionInvocationPolicy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:InvokeAsync"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

// Attach policy to IAM Role for Step Function
resource "aws_iam_role_policy_attachment" "iam_for_step_function_attach_policy_invoke_lambda" {
  role       = aws_iam_role.iam_for_step_functions.name
  policy_arn = aws_iam_policy.policy_invoke_lambda.arn
}

module "example_one_step" {
  source = "./modules/step-function"

  state_machine_name         = "shawns-test-terraform-state-machine"
  state_machine_iam_role_arn = aws_iam_role.iam_for_step_functions.arn
  state_machine_definition = templatefile("./machines/example_one.yml", {
    power_lambda_arn  = module.power_lambda.lambda_arn,
    random_lambda_arn = module.random_lambda.lambda_arn,
  })
}