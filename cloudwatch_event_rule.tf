resource "aws_cloudwatch_event_rule" "adminconsolehourlyschedule" {
  description = "CloudWatch rule to run lambda every hour"
  name = "admin-console-every-hour"
  schedule_expression = "cron(0 * * * ? *)"
}

resource "aws_cloudwatch_event_target" "check_adminconsolehourlyschedule" {
    rule = aws_cloudwatch_event_rule.adminconsolehourlyschedule.name
    target_id = "adminconsoledataprepare"
    arn = aws_lambda_function.adminconsoledataprepare.arn
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_adminconsoledataprepare" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.adminconsoledataprepare.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.adminconsolehourlyschedule.arn
}