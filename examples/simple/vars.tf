variable "document_name" {
  type        = string
  description = "Document name"
  default     = "example"
}

variable "document_type" {
  type        = string
  description = "Document type: Command or Automation"
  default     = "Command"
}

variable "document_format" {
  type        = string
  description = "Document format YAML or JSON"
  default     = "YAML"
}

variable "tags" {
  type        = map(string)
  description = "document name"
  default = {
    Purpore    = "ssm-doc-module-v0.0.1"
    GitHubRepo = "ssm-doc-module"
    Country    = "Brasil"
    State      = "SP"
    Owner      = "Cloud Malino"
    Alias      = "MackBr"
  }
}

variable "share_doc" {
  type        = bool
  description = "Define whether to share of not the document"
  default     = true
}

variable "public_doc" {
  type        = bool
  description = "Define if the documento should be public"
  default     = false
}