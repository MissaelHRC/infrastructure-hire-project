resource "aws_ecr_repository" "missael_hire_project_ecr_repository" {
  name                 = var.aws_ecr_repository_name
  image_tag_mutability = "IMMUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

data "aws_iam_policy_document" "missael_hire_project_ecr_policy" {
  statement {
    sid       = "GetAuthorizationToken"
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "ecr:GetAuthorizationToken"
    ]
  }

  statement {
    sid    = "CreateAndManageRepositoryContents"
    effect = "Allow"
    resources = [
      aws_ecr_repository.missael_hire_project_ecr_repository.arn,
      "${aws_ecr_repository.missael_hire_project_ecr_repository.arn}/*",
    ]
    #Update scope
    actions = [
      "ecr:*"
    ]
  }
}
