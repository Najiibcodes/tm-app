resource "aws_iam_role" "ecs_task_execution_role" {
  count = length(data.aws_iam_role.existing_role) == 0 ? 1 : 0

  name               = var.execution_role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  count      = length(aws_iam_role.ecs_task_execution_role) > 0 ? 1 : 0
  role       = aws_iam_role.ecs_task_execution_role[0].name
  policy_arn = var.execution_policy_arn
}

data "aws_iam_role" "existing_role" {
  name = var.execution_role_name
}
