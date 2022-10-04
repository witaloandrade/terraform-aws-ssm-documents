# terraform-aws-ssm-documents

This terraform module will allow creation and share AWS Systems Manager Documents. Documents can me an Automation RunBook or RunCommand. It can be shared to many accounts per region or set to be a public document. If set to the shared it can read aws account id from json file for easier deployment.

## Usage Single Region

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
```


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
## Reading account id from file

The function below will read aws account id from file if the variable share_doc is set to true and the accounts.son file exist. You can edit this file as long you keep the json schema. If you don't want to share the doc ser share_doc to false. You can also set the var public_document to true or false to make you document public.

```bash
account_ids = var.share_doc && fileexists("${path.module}/accounts.json") ? (join(",", jsondecode(file("${path.module}/accounts.json")).Accounts[*].id)) : ""
```

## Multi region deployment

AWS Systems Manager documents are region based, meaning that document creation and sharing resources has to happen on each region the document is needed. For that you can rely on terraform multi region deployment and provider alias. Check the example code.  
