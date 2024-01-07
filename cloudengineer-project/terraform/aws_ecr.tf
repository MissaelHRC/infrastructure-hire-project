resource "aws_ecr_repository" "missael_hire_project_ecr_repository_app" {
  name                 = var.aws_ecr_app_repository_name
  image_tag_mutability = "MUTABLE" #Best Practice IMMUTABLE

  force_delete = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "missael_hire_project_ecr_repository_proxy" {
  name                 = var.aws_ecr_proxy_repository_name
  image_tag_mutability = "MUTABLE" #Best Practice IMMUTABLE
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
      aws_ecr_repository.missael_hire_project_ecr_repository_app.arn,
      "${aws_ecr_repository.missael_hire_project_ecr_repository_app.arn}/*",
      aws_ecr_repository.missael_hire_project_ecr_repository_proxy.arn,
      "${aws_ecr_repository.missael_hire_project_ecr_repository_proxy.arn}/*",
    ]
    #Update scope
    actions = [
      "ecr:*"
    ]
  }
}
