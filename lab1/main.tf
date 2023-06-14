provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {

  name     = "rgTest"
  location = "west us3"
}

#common cmds
/* terraform init
terrform validate
terraform plan
terraform fmt
terraform destroy */