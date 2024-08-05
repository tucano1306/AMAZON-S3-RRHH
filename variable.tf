variable "region" {
  description = "La región de AWS donde se creará el bucket de S3"
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "El nombre del bucket de S3"
  type        = string
}

variable "read_access_arn" {
  description = "El ARN de la entidad que tendrá acceso de lectura"
  type        = string
}

variable "write_access_arn" {
  description = "El ARN de la entidad que tendrá acceso de escritura"
  type        = string
}