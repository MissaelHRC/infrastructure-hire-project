resource "aws_s3_bucket" "missael_hire_project_bucket" {
  bucket = var.aws_bucket_name

  tags = {
    Name        = "MissaelHireProjectBucket"
    Environment = "Production"
  }
}

resource "aws_s3_object" "example_object" {
  bucket = var.aws_bucket_name
  key    = "example.json"
  source = "../example.json"

  depends_on = [aws_s3_bucket.missael_hire_project_bucket]
}