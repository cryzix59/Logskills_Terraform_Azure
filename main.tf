##### ====== INILISATION ====== ######

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configuration d'Azure
provider "azurerm" {
  features {}

  subscription_id = "84658975-349d-4394-8994-8ac9d21ab43c"
  tenant_id       = "b5cdd443-5a28-4ab2-8018-814333d4018f"
}

