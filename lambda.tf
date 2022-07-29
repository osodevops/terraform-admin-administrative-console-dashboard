resource "aws_lambda_function" "adminconsoledataprepare" {
  filename      = "data_prepare.zip"
  function_name = "data_prepare"
  description = "admin console dataprepare lambda function"

  environment {
    variables = {
        aws_region = data.aws_region.current.name
    }
  }
  handler = "data_prepare.lambda_handler"
  source_code_hash = filebase64sha256("data_prepare.zip")

  runtime = "python3.7"
  memory_size = "512"
  timeout = "900"
  role = aws_iam_role.quick_sight_admin_console.arn

#   code_signing_config_arn = {
#     S3Bucket = "admin-console-dataprepare-code"
#     S3Key = "data_prepare.zip"
#   }
}

resource "aws_lambda_permission" "adminconsolehourlyscheduledataprepare" {
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.adminconsoledataprepare.arn
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.adminconsolehourlyschedule.arn
}

