#TAGS
variable "tags" {
  type = "map"
  description = "Tags for SQS"
  default = {}
}

#Setup
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

variable "sqs_dead_letter_max_receive_counts" {
  description = "List of max retrieve count for each SQS dead letter queue."
  type = "list"
}