data "aws_iam_policy_document" "assume_role" {
  statement {
    sid     = "ECRRepositoryPolicy"
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"]
    }

    condition {
      test     = "ForAnyValue:StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      #Update to specific ref branch
      values = concat(formatlist("repo:MissaelHRC/${var.github_repo_name}:ref:*")
      )
    }
  }
}

resource "aws_iam_role" "this" {
  name                 = "github-${var.github_repo_name}-ecr-role"
  max_session_duration = "36000"
  assume_role_policy   = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.allow_ecr.arn
}

resource "aws_iam_policy" "allow_ecr" {
  name   = "infrastructure-hire-project-cr-policy"
  policy = data.aws_iam_policy_document.missael_hire_project_ecr_policy.json
}
