#required otherwise circular dependency between IAM and Lambda
locals {
  complete_environment_variables = "${merge(map("SQS_QUEUES_URLS", "${module.sqs.sqs_queue_ids}"), var.environment_variables)}"
  lambda_function_name = "${var.project}-${var.lambda_function_name}-${terraform.workspace}"
}

module "apigw" {
  source = "./modules/services/api-gateway"

  #Setup
  api_gw_name = "${var.project}-API-Gateway-${terraform.workspace}"
  stage_name = "${terraform.workspace}"
  method = "${var.api_gw_method}"
  lambda_arn = "${module.lambda.lambda_arn}"
  region = "${var.region}"
  lambda_name = "${module.lambda.lambda_name}"
  dependency_list = "${var.api_gw_dependency_list}"
}

module "lambda" {
  source = "./modules/services/lambda"

  #Setup
  region = "${var.region}"
  lambda_function_name = "${local.lambda_function_name}"
  lambda_description = "${var.lambda_description}"
  lambda_runtime = "${var.lambda_runtime}"
  lambda_handler = "${var.lambda_handler}"
  lambda_timeout = "${var.lambda_timeout}"
  lambda_code_s3_bucket = "${var.lambda_code_s3_bucket}"
  lambda_code_s3_key = "${var.lambda_code_s3_key}"
  lambda_code_s3_storage_class = "${var.lambda_code_s3_storage_class}"
  lambda_code_s3_bucket_visibility = "${var.lambda_code_s3_bucket_visibility}"
  lambda_zip_path = "${var.lambda_zip_path}"
  lambda_memory_size = "${var.lambda_memory_size}"

  #Internal
  lambda_role = "${module.iam.lambda_role_arn}"

  #Environment variables
  environment_variables = "${local.complete_environment_variables}"

  #Tags
  tags = "${var.tags}"
}

module "sqs" {
  source = "./modules/services/sqs"

  #Setup
  sqs_queue_names = "${var.sqs_queue_names}"
  sqs_queue_delay_seconds = "${var.sqs_queue_delay_seconds}"
  sqs_queue_max_message_sizes = "${var.sqs_queue_max_message_sizes}"
  sqs_queue_message_retention_seconds = "${var.sqs_queue_message_retention_seconds}"
  sqs_queue_receive_wait_time_seconds = "${var.sqs_queue_receive_wait_time_seconds}"
  sqs_queue_fifos = "${var.sqs_queue_fifos}"
  sqs_queue_content_based_deduplications = "${var.sqs_queue_content_based_deduplications}"
  sqs_dead_letter_max_receive_counts = "${var.sqs_dead_letter_max_receive_counts}"

  #Tags
  tags = "${var.tags}"
}

module "iam" {
  source = "./modules/global/iam"

  #Setup
  lambda_name = "${local.lambda_function_name}"
  api_gw_name = "${module.apigw.api_gw_name}"
  api_gw_id = "${module.apigw.api_gw_id}"
  sqs_arn_list = "${module.sqs.sqs_queue_arns}"
  sqs_policy_action_lists = "${var.sqs_policy_action_lists}"
}