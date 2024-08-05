output "bucket_arn" {
  description = "El ARN del bucket de S3"
  value       = aws_s3_bucket.hr_documents.arn
}

output "bucket_name" {
  description = "El nombre del bucket de S3"
  value       = aws_s3_bucket.hr_documents.bucket
}