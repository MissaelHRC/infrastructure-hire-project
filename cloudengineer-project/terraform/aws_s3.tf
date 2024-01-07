resource "aws_s3_bucket" "missael_hire_project_bucket" {
  bucket = var.aws_bucket_name

  tags = {
    Name        = "MissaelHireProjectBucket"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_policy" "missael_hire_project_bucket_policy" {
  bucket = aws_s3_bucket.missael_hire_project_bucket.id
  policy = data.aws_iam_policy_document.missael_hire_project_bucket_policy.json
}

data "aws_iam_policy_document" "missael_hire_project_bucket_policy" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [var.aws_account_id]
    }

    actions = [
      "s3:*",
    ]

    resources = [
      aws_s3_bucket.missael_hire_project_bucket.arn,
      "${aws_s3_bucket.missael_hire_project_bucket.arn}/*",
    ]
  }
}

resource "aws_s3_object" "example_object" {
  bucket = var.aws_bucket_name
  key    = "example.json"
  source = "../example.json"

  depends_on = [aws_s3_bucket.missael_hire_project_bucket]
}