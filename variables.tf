#TAGS
variable "tags" {
  type = "map"
  description = "Tags for lambda"
  default = {}
}


#Environment variables
variable "environment_variables" {
  type = "map"
  description = "Azure Bot Subscription ID"
}


#SETUP

#Global
variable "region" {
  description = "Region to deploy in"
}

variable "project" {
  description = "Name of project"
}

#Lambda
variable "lambda_function_name" {
  description = "Local path to Lambda zip code"
}

variable "lambda_description" {
  default = ""
  description = "Lambda description"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
}

variable "lambda_handler" {
  description = "Lambda handler path"
}

variable "lambda_timeout" {
  description = "Maximum runtime for Lambda"
  default = 30
}

variable "lambda_code_s3_bucket_new" {
  default = "defaultBucket"
  description = "S3 bucket with source code"
}

variable "lambda_code_s3_bucket_use_existing" {
  default = "true"
  description = "Boolean flag to specify whether to use 'lambda_code_s3_bucket_new' and create new bucket or to use 'lambda_code_s3_bucket_existing and use existing S3 bucket and now a generate new one"
}

variable "lambda_code_s3_bucket_existing" {
  description = "Existing 'aws_s3_bucket.bucket'"
}

variable "lambda_code_s3_key" {
  description = "Location of Lambda code in S3 bucket"
}

variable "lambda_code_s3_storage_class" {
  description = "Lambda code S3 storage class"
  default = "ONEZONE_IA"
}

variable "lambda_code_s3_bucket_visibility" {
  default = "private"
  description = "S3 bucket ACL"
}

variable "lambda_zip_path" {
  description = "Local path to Lambda zip code"
}

variable "lambda_memory_size" {
  description = "Lambda memory size"
}


#API Gateway Setup
variable "api_gw_method" {
  description = "API Gateway method (GET,POST...)"
  default = "POST"
}

variable "api_gw_dependency_list" {
  description = "List of aws_api_gateway_integration* that require aws_api_gateway_deployment dependency"
  type = "list"
  default = []
}

#SQS
variable "sqs_queue_names" {
  description = "List of SQS Queue Names"
  type = "list"
}

variable "sqs_queue_delay_seconds" {
  description = "List of SQS Queue Delay Seconds"
  type = "list"
}

variable "sqs_queue_max_message_sizes" {
  description = "List of SQS Queue Max Message Size"
  type = "list"
}

variable "sqs_queue_message_retention_seconds" {
  description = "List of SQS Queue Delay Message Retention Seconds"
  type = "list"
}

variable "sqs_queue_receive_wait_time_seconds" {
  description = "List of SQS Queue Receive Wait Time Seconds"
  type = "list"
}

variable "sqs_queue_fifos" {
  description = "List of SQS Queue FIFO"
  type = "list"
}

variable "sqs_queue_content_based_deduplications" {
  description = "List of SQS Queue Content Based Deduplication"
  type = "list"
}

variable "sqs_policy_action_lists" {
  description = "List of Actions to be executed"
  type = "list"
}

variable "sqs_dead_letter_max_receive_counts" {
  description = "List of max retrieve count for each SQS dead letter queue."
  type = "list"
}