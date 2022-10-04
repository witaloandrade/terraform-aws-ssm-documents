locals {
  content = file("${var.document_name}.${var.document_format}")
  # adds aws accounts ids from json file if var.share_doc is set to true and file accounts existes, else will retunt empty value
  account_ids = var.share_doc && fileexists("${path.module}/accounts.json") ? (join(",", jsondecode(file("${path.module}/accounts.json")).Accounts[*].id)) : ""

}

module "virginia" {
  source = "../"
  providers = {
    aws = aws.virginia
  }

  document_name    = var.document_name
  document_type    = var.document_type
  document_format  = var.document_format
  document_content = local.content
  share_doc        = var.share_doc
  public_document  = var.public_doc
  account_ids      = local.account_ids
  tags             = var.tags
}

module "oregon" {
  source = "../"
  providers = {
    aws = aws.oregon
  }

  document_name    = var.document_name
  document_type    = var.document_type
  document_format  = var.document_format
  document_content = local.content
  share_doc        = var.share_doc
  public_document  = var.public_doc
  account_ids      = local.account_ids
  tags             = var.tags
}
