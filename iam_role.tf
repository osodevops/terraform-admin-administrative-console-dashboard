resource "aws_iam_role" "quick_sight_admin_console" {
  name = "QuickSightAdminConsole"

  assume_role_policy = <<POLICY
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "quick_sight_attachment" {
  name       = "QuickSight-AdminConsolePolicyAttachment"
  roles      = [aws_iam_role.quick_sight_admin_console.name]
  policy_arn = aws_iam_policy.quick_sight_admin_console_policy.arn
}


resource "aws_iam_policy" "quick_sight_admin_console_policy" {
  name        = "QuickSight-AdminConsolePolicy"
  description = "Allow access to ssm, lambda, log, qs, s3 and sts"
  policy      = data.aws_iam_policy_document.quick_sight_admin_console_policy_document.json
}

data "aws_iam_policy_document" "quick_sight_admin_console_policy_document" {
  statement {
    sid    = "BasePermissions"
    effect = "Allow"
    actions =  [
        "ssm:GetParameters",
        "ssm:GetParameter",
        "ssm:GetParametersByPath",
        "lambda:InvokeFunction",
        "logs:CreateLogStream",
        "logs:CreateLogGroup",
        "logs:PutLogEvents",
        "quicksight:ListNamespaces",
        "quicksight:DescribeNamespace",
        "quicksight:PassDataSet",
        "quicksight:ListThemeVersions",
        "quicksight:ListUserGroups",
        "quicksight:DescribeThemeAlias",
        "quicksight:SearchDashboards",
        "quicksight:DescribeUser",
        "quicksight:GetAuthCode",
        "quicksight:DescribeDataSetPermissions",
        "quicksight:DescribeDashboard",
        "quicksight:ListDataSources",
        "quicksight:ListGroups",
        "quicksight:DescribeDataSourcePermissions",
        "quicksight:DescribeAnalysisPermissions",
        "quicksight:ListThemeAliases",
        "quicksight:DescribeDataSource",
        "quicksight:ListGroupMemberships",
        "quicksight:DescribeDashboardPermissions",
        "quicksight:ListDashboards",
        "quicksight:PassDataSource",
        "quicksight:ListDataSets",
        "quicksight:ListUsers",
        "quicksight:ListIngestions",
        "quicksight:SearchAnalyses",
        "quicksight:ListAnalyses",
        "quicksight:ListDashboardVersions",
        "quicksight:DescribeIngestion",
        "quicksight:DescribeGroup",
        "quicksight:DescribeAnalysis",
        "quicksight:DescribeDataSet",
        "quicksight:GetGroupMapping",
        "quicksight:DescribeTheme",
        "quicksight:DescribeThemePermissions",
        "quicksight:ListThemes",
        "s3:HeadBucket",
        "s3:ListAllMyBuckets",
        "s3:PutObject",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:GetObjectVersionForReplication",
        "s3:GetBucketPolicy",
        "s3:GetObjectVersion",
        "cloudwatch:PutMetricData",
        "sts:GetCallerIdentity",
        "sts:AssumeRole"]
    resources = [
      "*"
    ]
  }
}