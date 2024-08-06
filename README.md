# AMAZON-S3-RRHH
Arquitectura de Amazon S3 para Documentos de RRHH
Componentes Principales
Amazon S3 Bucket:
Nombre del Bucket: hr-documents-unique-suffix (debe ser único a nivel global).
Propósito: Almacenar documentos de empleados, currículos y otros archivos relacionados con recursos humanos.
Versionado del Bucket:
Propósito: Mantener versiones de los objetos almacenados en el bucket para poder recuperar versiones anteriores en caso de modificaciones o eliminaciones accidentales.
Configuración: Habilitado mediante aws_s3_bucket_versioning.
Cifrado del Lado del Servidor (SSE):
Propósito: Proteger los datos almacenados en el bucket mediante cifrado automático en el lado del servidor.
Configuración: Utiliza el algoritmo de cifrado AES-256 mediante aws_s3_bucket_server_side_encryption_configuration.
