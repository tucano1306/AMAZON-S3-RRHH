variable "region" {
  description = "La región de AWS donde se creará el bucket de S3"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "El nombre del bucket de S3"
  type        = string
  default     = "hr-documents-unique-suffix"  # Cambia esto a un nombre único
}


















