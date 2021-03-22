### === CRÉATION DES MACHINES HA PROXY === ####


## HaProxy Primary
resource "azurerm_linux_virtual_machine" "HaProxy" {
    name                  = "HaProxy"
    location              = var.azure_location_Paris
    resource_group_name   = azurerm_resource_group.Ressource_Paris_HAProxy.name
    network_interface_ids = [azurerm_network_interface.NIC_HaProxy.id]
    size                  = "Standard_B1ls"

    os_disk {
        name              = "Disk_HaProxy"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "HaProxy"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.ssh_key_HaProxy.public_key
    }
}

# ## HaProxy Backup
# resource "azurerm_linux_virtual_machine" "HaProxy_backup" {
#     name                  = "HaProxy_backup"
#     location              = var.azure_location_Paris
#     resource_group_name   = azurerm_resource_group.Ressource_Paris_HAProxy.name
#     network_interface_ids = [azurerm_network_interface.NIC_HaProxy_backup.id]
#     size                  = "Standard_B1ls"

#     os_disk {
#         name              = "Disk_HaProxy_backup"
#         caching           = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#     }

#     source_image_reference {
#         publisher = "Canonical"
#         offer     = "UbuntuServer"
#         sku       = "18.04-LTS"
#         version   = "latest"
#     }

#     computer_name  = "HaProxy-backup"
#     admin_username = "azureuser"
#     disable_password_authentication = true

#     admin_ssh_key {
#         username       = "azureuser"
#         public_key     = azurerm_ssh_public_key.ssh_key_HaProxy.public_key
#     }
# }


### === FIN DES MACHINES HA PROXY === ####



### === CRÉATION DES MACHINES API & BDD=== ###


# Serveur API Primary
resource "azurerm_linux_virtual_machine" "API_Primary" {
    name                  = "API_Primary"
    location              = var.azure_location_Paris
    resource_group_name   = azurerm_resource_group.Ressource_Paris_VM.name
    network_interface_ids = [azurerm_network_interface.NIC_API_Primary.id]
    size                  = "Standard_B1ls"
    zone                  = "1"  #Paris AZ 1

    os_disk {
        name              = "Disk_API_Primary"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "API-Primary"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.ssh_key_VMs.public_key
    }
}

# Serveur API Backup
resource "azurerm_linux_virtual_machine" "API_Backup" {
    name                  = "API_Backup"
    location              = var.azure_location_Paris
    resource_group_name   = azurerm_resource_group.Ressource_Paris_VM.name
    network_interface_ids = [azurerm_network_interface.NIC_API_Backup.id]
    size                  = "Standard_B1ls"
    zone                  = "2"  #Paris AZ 2

    os_disk {
        name              = "Disk_API_Backup"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "API-Backup"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.ssh_key_VMs.public_key
    }
}


# Serveur MySQL
resource "azurerm_linux_virtual_machine" "MySQL" {
    name                  = "MySQL"
    location              = var.azure_location_Paris
    resource_group_name   = azurerm_resource_group.Ressource_Paris_VM.name
    network_interface_ids = [azurerm_network_interface.NIC_MySQL.id]
    size                  = "Standard_B1ls"
    zone                  = "1"  #Paris AZ 1

    os_disk {
        name              = "Disk_MySQL"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "MySQL"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.ssh_key_VMs.public_key
    }
}

# Machine de supervision
resource "azurerm_linux_virtual_machine" "Shinken" {
    name                  = "Shinken"
    location              = var.azure_location_Paris
    resource_group_name   = azurerm_resource_group.Ressource_Paris_VM.name
    network_interface_ids = [azurerm_network_interface.NIC_shinken.id]
    size                  = "Standard_A1_v2"  ## COUTE CHER NE PAS LAISSER ALLUMEE

    os_disk {
        name              = "Disk_Shinken"
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "Shinken"
    admin_username = "azureuser"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "azureuser"
        public_key     = azurerm_ssh_public_key.ssh_key_HaProxy.public_key
    }
}
### === FIN DES MACHINES API & BDD === ###
