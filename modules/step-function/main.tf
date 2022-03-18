// Create state machine for step function
resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = var.state_machine_name
  role_arn = var.state_machine_iam_role_arn

  definition = jsonencode(yamldecode(var.state_machine_definition))
}