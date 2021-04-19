
### === CRÉATION DES CLÉS SSH === ####

# Création de la clé SSH pour accéder aux machines HaProxy
resource "azurerm_ssh_public_key" "ssh_key_HaProxy" {
  name                = "ssh_key_HaProxy"
  resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
  location            = var.azure_location_Paris
  public_key          = "YOUR_OWN_SSH-KEY"
}

# Création de la clé SSH pour accéder aux machines API
resource "azurerm_ssh_public_key" "ssh_key_VMs" {
  name                = "ssh_key_VMs"
  resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
  location            = var.azure_location_Paris
  public_key          = "YOUR_OWN_SSH-KEY"
}

### === FIN DES CLÉS SSH  === ####
