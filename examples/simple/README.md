# simple doc

Create simple ssm doc in two regions and share with account ids from json

## Usage Many Regions

```bash
module "virginia" {
  source = "../"
  providers = {
    aws = aws.virginia
  }

  document_name    = var.document_name
  document_type    = var.document_type
  document_format  = var.document_format
  document_content = local.content
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
  public_document  = var.public_doc
  account_ids      = local.account_ids
  tags             = var.tags

}
```