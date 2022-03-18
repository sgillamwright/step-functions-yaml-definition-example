variable "state_machine_name" {
  description = "State machine name"
}

variable "state_machine_iam_role_arn" {
  description = "IAM Role ARN to be used for the state machine"
}

variable "state_machine_definition" {
  description = "State Machine definition to be created"
}