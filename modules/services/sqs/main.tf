# SQS QUEUE
resource "aws_sqs_queue" "sqs_queue" {
  count                       = "${length(var.sqs_queue_names)}"
  name                        = "${var.sqs_queue_fifos[count.index] ? "${var.sqs_queue_names[count.index]}-${terraform.workspace}.fifo" : "var.sqs_queue_names[count.index]-${terraform.workspace}"}"
  fifo_queue                  = "${var.sqs_queue_fifos[count.index]}"
  content_based_deduplication = "${var.sqs_queue_content_based_deduplications[count.index]}"
  delay_seconds               = "${var.sqs_queue_delay_seconds[count.index]}"
  max_message_size            = "${var.sqs_queue_max_message_sizes[count.index]}"
  message_retention_seconds   = "${var.sqs_queue_message_retention_seconds[count.index]}"
  receive_wait_time_seconds   = "${var.sqs_queue_receive_wait_time_seconds[count.index]}"
  redrive_policy              = "{\"deadLetterTargetArn\":\"${element(aws_sqs_queue.sqs_dead_letter_queue.*.arn, count.index)}\",\"maxReceiveCount\":\"${var.sqs_dead_letter_max_receive_counts[count.index]}\"}"

  tags = "${var.tags}"
}

# SQS DEAD LETTER QUEUE
resource "aws_sqs_queue" "sqs_dead_letter_queue" {
  count                       = "${length(var.sqs_queue_names)}"
  name                        = "${var.sqs_queue_fifos[count.index] ? "${var.sqs_queue_names[count.index]}_dead_letter-${terraform.workspace}.fifo" : "${var.sqs_queue_names[count.index]}_dead_letter-${terraform.workspace}"}"
  fifo_queue                  = "${var.sqs_queue_fifos[count.index]}"
  content_based_deduplication = "${var.sqs_queue_content_based_deduplications[count.index]}"
  delay_seconds               = "${var.sqs_queue_delay_seconds[count.index]}"
  max_message_size            = "${var.sqs_queue_max_message_sizes[count.index]}"
  message_retention_seconds   = 1209600
  receive_wait_time_seconds   = "${var.sqs_queue_receive_wait_time_seconds[count.index]}"

  tags = "${var.tags}"
}