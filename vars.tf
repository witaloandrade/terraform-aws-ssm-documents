variable "document_name" {
  type        = string
  description = "Document name"
  default     = ""
}

variable "document_format" {
  type        = string
  description = "Document format: YAML or JSON"
  default     = ""
}

variable "document_type" {
  type        = string
  description = "Document type: Command or Automation"
  default     = ""
}

variable "document_content" {
  type        = string
  description = "Document content must be valid ssm document"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Document tags"
  default     = {}
}

variable "public_document" {
  type        = bool
  description = "Define if documento should be public"
  default     = false
}

variable "account_ids" {
  type        = string
  description = "AWS AcountIds to share the document. Commma Separeted ex.\"123456789012,123456789012\""
  default     = ""
}


variable "share_doc" {
  type        = bool
  description = "Define whether to share of not the document"
  default     = false
}

variable "public_doc" {
  type        = bool
  description = "Define if the documento should be public"
  default     = false
}