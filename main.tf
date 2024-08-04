provider "aws" {
  region = var.region
}

resource "aws_sqs_queue" "pedido-gerado-sh_queue" {
  name                       = "pedido-gerado"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  #sqs_managed_sse_enabled    = true
}

data "aws_iam_policy_document" "sh_sqs_policy" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.pedido-gerado-sh_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.pedido-gerado-sh_queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy.json
}

resource "aws_sqs_queue" "pagamento-pendente-sh_queue" {
  name                       = "pagamento-pendente"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  #sqs_managed_sse_enabled    = true
}

data "aws_iam_policy_document" "sh_sqs_policy" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.pagamento-pendente-sh_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.pagamento-pendente-sh_queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy.json
}

resource "aws_sqs_queue" "pagamento-confirmado-sh_queue" {
  name                       = "pagamento-confirmado"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  #sqs_managed_sse_enabled    = true
}

data "aws_iam_policy_document" "sh_sqs_policy" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.pagamento-confirmado-sh_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.pagamento-confirmado-sh_queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy.json
}

resource "aws_sqs_queue" "preparo-iniciado-sh_queue" {
  name                       = "preparo-iniciado"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  #sqs_managed_sse_enabled    = true
}

data "aws_iam_policy_document" "sh_sqs_policy" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.preparo-iniciado-sh_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.preparo-iniciado-sh_queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy.json
}

resource "aws_sqs_queue" "preparo-finalizado-sh_queue" {
  name                       = "preparo-finalizado"
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  #sqs_managed_sse_enabled    = true
}

data "aws_iam_policy_document" "sh_sqs_policy" {
  statement {
    sid    = "shsqsstatement"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "sqs:SendMessage",
      "sqs:ReceiveMessage"
    ]
    resources = [
      aws_sqs_queue.preparo-finalizado-sh_queue.arn
    ]
  }
}

resource "aws_sqs_queue_policy" "sh_sqs_policy" {
  queue_url = aws_sqs_queue.preparo-finalizado-sh_queue.id
  policy    = data.aws_iam_policy_document.sh_sqs_policy.json
}
