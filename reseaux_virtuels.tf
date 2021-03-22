### ==== RÉSEAU PRIVÉ VIRTUEL === ###

# Création du réseau virtuel 
resource "azurerm_virtual_network" "Network_Paris_global" {
    name                = "Network_Paris_global"
    address_space       = [var.address_space]
    location            = var.azure_location_Paris
    resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
}


# Création du sous-réseau global
resource "azurerm_subnet" "Subnet_Paris_Global" {
    name                 = "Subnet_Paris_Global"
    resource_group_name  = azurerm_resource_group.Ressource_Paris_VM.name
    virtual_network_name = azurerm_virtual_network.Network_Paris_global.name
    address_prefixes       = [var.address_prefix] 
}

### ==== FIN RÉSEAU PRIVÉ VIRTUEL === ###