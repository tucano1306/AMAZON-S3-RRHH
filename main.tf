provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "hr_documents" {
  bucket = var.bucket_name

  # Habilitar el versionado para mantener versiones de los documentos
  versioning {
    enabled = true
  }

  # Configurar el cifrado por defecto para los objetos en el bucket
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Configurar políticas de acceso para asegurar el bucket
  policy = data.aws_iam_policy_document.bucket_policy.json
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