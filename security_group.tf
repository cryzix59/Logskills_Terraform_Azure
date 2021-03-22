### === CRÉATION DES GROUPES DE SÉCURITÉ === ###


# Groupe de sécurité pour autoriser le SSH
# => HaProxy (FRONT)
resource "azurerm_network_security_group" "Allow_SSH_HTTP_HTTPS_Paris_FRONT" {
    name                = "Allow_SSH_HTTP_HTTPS_Paris_FRONT"
    location            = var.azure_location_Paris
    resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
    
    # On accepte tout en sortie
    security_rule {
        name                       = "Allow_ALL_Outbond"
        priority                   = 100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "*"
    }
    
    security_rule {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "10.0.0.0/24"
    }
    security_rule {
        name                       = "HTTP"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "10.0.0.0/24"
    }

        security_rule {
        name                       = "HTTPS"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "10.0.0.0/24"
    }

    # On refuse tout en entrée
    security_rule {
        name                       = "Deny_ALL_Inbond"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

# Groupe de sécurité pour autoriser le SSH
# => VM API (BACK)
resource "azurerm_network_security_group" "Allow_SSH_HTTP_HTTPS_Paris_BACK" {
    name                = "Allow_SSH_HTTP_HTTPS_Paris_BACK"
    location            = var.azure_location_Paris
    resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
    
    # On accepte tout en sortie
    security_rule {
        name                       = "Allow_ALL_Outbond"
        priority                   = 100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }
    
    security_rule {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }
    security_rule {
        name                       = "HTTP"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }

        security_rule {
        name                       = "HTTPS"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }

    # On refuse tout en entrée
    security_rule {
        name                       = "Deny_ALL_Inbond"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }
}


# # Groupe de sécurité pour autoriser MySQL et SSH 
# => VM BDD
resource "azurerm_network_security_group" "Allow_SSH_MySQL_Paris" {
    name                = "Allow_SSH_MySQL_Paris"
    location            = var.azure_location_Paris
    resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
    
    # On accepte tout en sortie
    security_rule {
        name                       = "Allow_ALL_Outbond"
        priority                   = 100
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }
    
    security_rule {
        name                       = "SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }
    security_rule {
        name                       = "MySQL"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }

    # On refuse tout en entrée
    security_rule {
        name                       = "Deny_ALL_Inbond"
        priority                   = 1000
        direction                  = "Inbound"
        access                     = "Deny"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.0.0/24"
        destination_address_prefix = "10.0.0.0/24"
    }
}

# # Association du groupe de sécurité aux HaProxy
resource "azurerm_network_interface_security_group_association" "association_SG_HaProxy" {
  network_interface_id      = azurerm_network_interface.NIC_HaProxy.id
  network_security_group_id = azurerm_network_security_group.Allow_SSH_HTTP_HTTPS_Paris_FRONT.id
}
# resource "azurerm_network_interface_security_group_association" "association_SG_HaProxy_backup" {
#   network_interface_id      = azurerm_network_interface.NIC_HaProxy_backup.id
#   network_security_group_id = azurerm_network_security_group.Allow_SSH_HTTP_HTTPS_Paris_FRONT.id
# }

## Association du groupe de sécurité aux VM API
resource "azurerm_network_interface_security_group_association" "association_SG_API_Primary" {
  network_interface_id      = azurerm_network_interface.NIC_API_Primary.id
  network_security_group_id = azurerm_network_security_group.Allow_SSH_HTTP_HTTPS_Paris_BACK.id
}
resource "azurerm_network_interface_security_group_association" "association_SG_API_backup" {
  network_interface_id      = azurerm_network_interface.NIC_API_Backup.id
  network_security_group_id = azurerm_network_security_group.Allow_SSH_HTTP_HTTPS_Paris_BACK.id
}

# Association du groupe de sécurité aux VM BDD
resource "azurerm_network_interface_security_group_association" "association_SG_VM_BDD" {
  network_interface_id      = azurerm_network_interface.NIC_MySQL.id
  network_security_group_id = azurerm_network_security_group.Allow_SSH_MySQL_Paris.id
}


### === FIN DES GROUPES DE SÉCURITÉ === ###