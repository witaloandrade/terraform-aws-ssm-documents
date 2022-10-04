output "document_name" {
  value       = try(aws_ssm_document.this.name, "")
  description = "Document name"
}