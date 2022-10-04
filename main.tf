resource "aws_ssm_document" "this" {
  name            = var.document_name
  document_type   = var.document_type
  document_format = var.document_format
  content         = var.document_content
  permissions = {
    type        = "Share"
    account_ids = var.public_document ? lower("all") : var.account_ids
  }

  tags = merge(
    { "Name" = var.document_name },
    var.tags
  )

}