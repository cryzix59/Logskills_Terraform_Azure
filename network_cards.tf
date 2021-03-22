### === CRÉATION DES CARTES RÉSEAU === ####

# Création de la carte réseau HaProxy (1 IP publique / 1 IP privée)
resource "azurerm_network_interface" "NIC_HaProxy" {
    name                        = "NIC_HaProxy"
    location                    = var.azure_location_Paris
    resource_group_name         = azurerm_resource_group.Ressource_Paris_HAProxy.name

    ip_configuration {
        name                          = "IP_Configuration_HaProxy"
        subnet_id                     = azurerm_subnet.Subnet_Paris_Global.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.0.10"
        public_ip_address_id          = azurerm_public_ip.IP_HaProxy_Paris.id
    }
}

# # HaProxy de backup => voir pour les IP de service
# resource "azurerm_network_interface" "NIC_HaProxy_backup" {
#     name                        = "NIC_HaProxy_backup"
#     location                    = var.azure_location_Paris
#     resource_group_name         = azurerm_resource_group.Ressource_Paris_HAProxy.name

#     ip_configuration {
#         name                          = "IP_Configuration_HaProxy_backup"
#         subnet_id                     = azurerm_subnet.Subnet_Paris_Global.id
#         private_ip_address_allocation = "Static"
#         private_ip_address            = "10.0.0.11"
#         public_ip_address_id          = azurerm_public_ip.IP_HaProxy_backup_Paris.id
#     }
# }

# Création des cartes réseaux des machines API
resource "azurerm_network_interface" "NIC_API_Primary" {
    name                        = "NIC_API_Primary"
    location                    = var.azure_location_Paris
    resource_group_name         = azurerm_resource_group.Ressource_Paris_VM.name

    ip_configuration {
        name                          = "IP_Configuration_API_Primary"
        subnet_id                     = azurerm_subnet.Subnet_Paris_Global.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.0.15"
    }
}
resource "azurerm_network_interface" "NIC_API_Backup" {
    name                        = "NIC_API_Backup"
    location                    = var.azure_location_Paris
    resource_group_name         = azurerm_resource_group.Ressource_Paris_VM.name

    ip_configuration {
        name                          = "IP_Configuration_API_Backup"
        subnet_id                     = azurerm_subnet.Subnet_Paris_Global.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.0.20"
    }
}

resource "azurerm_network_interface" "NIC_MySQL" {
    name                        = "NIC_MySQL"
    location                    = var.azure_location_Paris
    resource_group_name         = azurerm_resource_group.Ressource_Paris_VM.name

    ip_configuration {
        name                          = "IP_Configuration_NIC_MySQL"
        subnet_id                     = azurerm_subnet.Subnet_Paris_Global.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.0.25"
    }
}

resource "azurerm_network_interface" "NIC_shinken" {
    name                        = "NIC_shinken"
    location                    = var.azure_location_Paris
    resource_group_name         = azurerm_resource_group.Ressource_Paris_VM.name

    ip_configuration {
        name                          = "IP_Configuration_NIC_shinken"
        subnet_id                     = azurerm_subnet.Subnet_Paris_Global.id
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.0.0.31"
        public_ip_address_id          = azurerm_public_ip.IP_Shinken_Paris.id
    }
}
### === FIN DES CARTES RÉSEAU === ####