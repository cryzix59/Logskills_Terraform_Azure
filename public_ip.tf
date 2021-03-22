### === CRÉATION DES IP PUBLIQUES  === ####

# Création IP publique pour le HaProxy
resource "azurerm_public_ip" "IP_HaProxy_Paris" {  # IP statique pour le HaProxy global PARIS 
    name                         = "IP_HaProxy_Paris"
    location                     = var.azure_location_Paris
    resource_group_name          = azurerm_resource_group.Ressource_Paris_IP_publiques.name
    allocation_method            = "Static"
}

# # Création IP publique pour le HaProxy de backup
# resource "azurerm_public_ip" "IP_HaProxy_backup_Paris" {  # IP statique pour le HaProxy de backup PARIS 
#     name                         = "IP_HaProxy_backup_Paris"
#     location                     = var.azure_location_Paris
#     resource_group_name          = azurerm_resource_group.Ressource_Paris_IP_publiques.name
#     allocation_method            = "Static"
# }


# Création IP publique pour Shinken
resource "azurerm_public_ip" "IP_Shinken_Paris" {  # IP statique pour la machine de supervision
    name                         = "IP_Shinken_Paris"
    location                     = var.azure_location_Paris
    resource_group_name          = azurerm_resource_group.Ressource_Paris_IP_publiques.name
    allocation_method            = "Static"
}
### === FIN DES IP PUBLIQUES  === ####