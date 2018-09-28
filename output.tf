#API Gateway
output "api_gw_api_url" {
  value = "${module.apigw.api_url}"
}

output "api_gw_name" {
  value = "${module.apigw.api_gw_name}"
}

output "api_gw_id" {
  value = "${module.apigw.api_gw_id}"
}

output "api_gw_root_resource_id" {
  value = "${module.apigw.api_gw_root_resource_id}"
}

output "api_gw_api_resource_id" {
  value = "${module.apigw.api_gw_api_resource_id}"
}

output "api_gw_message_resource_id" {
  value = "${module.apigw.api_gw_message_resource_id}"
}

#Lambda
output "lambda_name" {
  value = "${module.lambda.lambda_name}"
}

output "lambda_arn" {
  value = "${module.lambda.lambda_arn}"
}

output "lambda_role_id" {
  value = "${module.iam.lambda_role_id}"
}

output "lambda_role_arn" {
  value = "${module.iam.lambda_role_arn}"
}

output "lambda_role_name" {
  value = "${module.iam.lambda_role_name}"
}

output "lambda_s3_bucket" {
  value = "${module.lambda.lambda_s3_bucket}"
}

output "sqs_queue_names" {
  value = ["${module.sqs.sqs_queue_names}"]
}

output "sqs_queue_ids" {
  value = "${module.sqs.sqs_queue_ids}"
}

output "sqs_queue_arns" {
  value = "${module.sqs.sqs_queue_arns}"
}

output "sqs_dead_letter_queue_names" {
  value = "${module.sqs.sqs_dead_letter_queue_names}"
}

output "sqs_dead_letter_queue_ids" {
  value = "${module.sqs.sqs_dead_letter_queue_ids}"
}
output "sqs_dead_letter_queue_arns" {
  value = "${module.sqs.sqs_dead_letter_queue_arns}"
}

