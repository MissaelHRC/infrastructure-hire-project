#############################################
# Create an IAM role to be assumed with OIDC
#############################################
module "iam_assumable_role_s3" {
  source                        = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  create_role                   = true
  role_name                     = "missael-hire-project-s3"
  provider_url                  = replace(module.eks.cluster_oidc_issuer_url, "https://", "")
  role_policy_arns              = [aws_iam_policy.missael_hire_project_s3_policy.arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:${local.k8s_service_account_namespace}:${local.k8s_service_account_name}"]
}

##############################
# Create an IAM policy here
##############################
resource "aws_iam_policy" "missael_hire_project_s3_policy" {
  name        = "missael_hire_project_s3_policy"
  description = "Missael Hire Project S3 Policy"

  policy = data.aws_iam_policy_document.missael_hire_project_s3_policy.json
}

####################################
# Define an IAM policy document here
####################################

data "aws_iam_policy_document" "missael_hire_project_s3_policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.missael_hire_project_bucket.arn,
      "${aws_s3_bucket.missael_hire_project_bucket.arn}/*",
    ]
  }
}
