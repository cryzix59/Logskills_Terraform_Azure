### === CRÉATION DES RESSOURCES ==== ###

# Ressource générale à PARIS
resource "azurerm_resource_group" "Ressource_Paris_VM" {
    name     = "Ressource_Paris_VM"
    location = var.azure_location_Paris
}

# Ressource globale pour les IP publiques à PARIS
resource "azurerm_resource_group" "Ressource_Paris_IP_publiques" {
    name     = "Ressource_Paris_IP_publiques"
    location = var.azure_location_Paris 
}

# Ressource globale des règles de sécurité à PARIS
resource "azurerm_resource_group" "Ressource_Paris_security_group" {
    name     = "Ressource_Paris_security_group"
    location = var.azure_location_Paris
}

# Ressource des loadbalancers à PARIS
resource "azurerm_resource_group" "Ressource_Paris_HAProxy" {
    name     = "Ressource_Paris_HAProxy"
    location = var.azure_location_Paris
}

# Ressource SQL PARIS
resource "azurerm_resource_group" "Ressource_Paris_SQL" {
    name     = "Ressource_Paris_SQL"
    location = var.azure_location_Paris
}

### ==== FIN DES RESSOURCES === ###