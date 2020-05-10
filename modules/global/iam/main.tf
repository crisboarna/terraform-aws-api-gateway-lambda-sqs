data "template_file" "lambda_sqs_policy" {
  count                                                 = var.sqs_count > 0 ? 1 : 0
  template                                              = file("${path.module}/sqs-policy.json")
  vars = {
    policy_arn_list                                     = join(", ", formatlist("\"%s\"", var.sqs_arn_list))
    policy_action_list                                  = join(", ", formatlist("\"%s\"", var.sqs_policy_action_lists))
  }
}

resource "aws_iam_role_policy" "SQS-Policy" {
  count                                                 = var.sqs_count > 0 ? 1 : 0
  name                                                  = "${aws_iam_role.lambda-role.name}-Policy"
  role                                                  = aws_iam_role.lambda-role.id
  policy                                                = data.template_file.lambda_sqs_policy.rendered
}

resource "aws_iam_role" "lambda-role" {
  name                                                  = "${var.lambda_name}-Role"
  assume_role_policy                                    = file("${path.module}/lambda-role.json")
}

data "template_file" "lambda_layer_policy" {
  count                                                 = length(var.lambda_layers) > 0 ? 1 : 0
  template                                              = file("${path.module}/data/dynamodb-policy.json")
  vars = {
    policy_arn_list                                     = join(
                                                            ", ",
                                                            formatlist(
                                                              "\"%s\"",
                                                              var.lambda_layers
                                                            ),
                                                        )
    policy_action_list                                  = join(
                                                            ", ",
                                                            formatlist(
                                                              "\"%s\"",
                                                            [
                                                              "lambda:GetLayerVersion"
                                                            ]
                                                            )
                                                          )
  }
}

resource "aws_iam_role_policy" "Layer-Policy" {
  name                                                  = "${aws_iam_role.lambda-role.name}-Layer-Policy"
  role                                                  = aws_iam_role.lambda-role.id
  policy                                                = data.template_file.lambda_layer_policy.rendered
}

resource "aws_iam_role" "apigw-role" {
  name                                                  = "${var.api_gw_name}-Role"
  assume_role_policy                                    = file("${path.module}/apigw-role.json")
}

resource "aws_iam_role_policy_attachment" "Lambda-CloudWatch-Logs-ReadWrite" {
  policy_arn                                            = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role                                                  = aws_iam_role.lambda-role.name
}

resource "aws_iam_role_policy_attachment" "API-GW-CloudWatch-Logs-ReadWrite" {
  policy_arn                                            = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
  role                                                  = aws_iam_role.apigw-role.name
}