provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "hr_documents" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.hr_documents.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.hr_documents.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.hr_documents.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.read_access_arn
        }
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.hr_documents.arn}/*"
      },
      {
        Effect = "Allow"
        Principal = {
          AWS = var.write_access_arn
        }
        Action = [
          "s3:PutObject",
          "s3:DeleteObject"
        ]
        Resource = "${aws_s3_bucket.hr_documents.arn}/*"
      }
    ]
  })
}