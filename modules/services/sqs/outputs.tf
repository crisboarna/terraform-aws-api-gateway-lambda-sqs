output "sqs_queue_names" {
  value = [aws_sqs_queue.sqs_queue.*.name]
}

output "sqs_queue_ids" {
  value = aws_sqs_queue.sqs_queue.*.id
}

output "sqs_queue_arns" {
  value = aws_sqs_queue.sqs_queue.*.arn
}

output "sqs_dead_letter_queue_names" {
  value = aws_sqs_queue.sqs_dead_letter_queue.*.name
}

output "sqs_dead_letter_queue_ids" {
  value = aws_sqs_queue.sqs_dead_letter_queue.*.id
}
output "sqs_dead_letter_queue_arns" {
  value = aws_sqs_queue.sqs_dead_letter_queue.*.arn
}

