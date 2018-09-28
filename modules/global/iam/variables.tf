variable "lambda_name" {
  description = "The name of the Lambda function"
}

variable "api_gw_name" {
  description = "The name of the API Gateway"
}

variable "api_gw_id" {
  description = "The API GW ID"
}

variable "sqs_arn_list" {
  type = "list"
  description = "List of ARN's to allow permissions for"
}

variable "sqs_policy_action_lists" {
  type = "list"
  description = "List of ARN's to allow permissions for"
}