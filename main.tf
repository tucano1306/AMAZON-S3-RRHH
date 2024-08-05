provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "hr_documents" {
  bucket = var.bucket_name

  # Configurar políticas de acceso para asegurar el bucket
  policy = data.aws_iam_policy_document.bucket_policy.json
}

# Recurso separado para el versionado del bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.hr_documents.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

# Recurso separado para la configuración de cifrado del lado del servidor
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.hr_documents.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.hr_documents.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [var.read_access_arn]
    }
  }

  statement {
    actions   = ["s3:PutObject", "s3:DeleteObject"]
    resources = ["${aws_s3_bucket.hr_documents.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [var.write_access_arn]
    }
  }
}