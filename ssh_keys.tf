
### === CRÉATION DES CLÉS SSH === ####

# Création de la clé SSH pour accéder aux machines HaProxy
resource "azurerm_ssh_public_key" "ssh_key_HaProxy" {
  name                = "ssh_key_HaProxy"
  resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
  location            = var.azure_location_Paris
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDnnwoTQiHuyxkI15sAj1+20oYX7F74GJ8Y4uSmYuN6JA7bBJoQ7ZIWee5a+lv/lbQx5BLXRPzijPSVEF3vLQkOeSLtpGFgzrKyDinlG81qo9mBFKSEwhXepbyQf6RUfuzTUcwXxTUMUIVEVp3F0ePcuwqmxn21i7cQAspxhRvRvcZZuO1YSCyEk2dQK6yGFcs7EoQdsZAe2Y11O3dJkeS5ati9B9AMRhuXM5kwhOrR5OUpBDCroJVj2B/qNKZiZ0Rgmv6n6/gM1RTnMNu16rd1FSUiD6Ihmqux9akOqeY9munzNo9ltV2iovyRjXwLRvyZaLXsxJ1DSns/Sk1x/AozBcKEuc++113qHFlQFdK5Pd3ta8oRMHOfbsz9A3SkhQAp/OPZzM2vTgNFgEp0p8fMrd60x7dm4vYdri3tvHgIiRchW5aThWrQTpd8RcrWgoPm8ZdeLmiAoSQJQ2b98XEh8IFu4+PuZcHcpkWlf2f0jwBWLrnFOsrNCTSJggNR/TE= etienne@MacBook-Pro-de-Etienne.local"
}

# Création de la clé SSH pour accéder aux machines API
resource "azurerm_ssh_public_key" "ssh_key_VMs" {
  name                = "ssh_key_VMs"
  resource_group_name = azurerm_resource_group.Ressource_Paris_VM.name
  location            = var.azure_location_Paris
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXYZJx6woj4HB0KCjRlASE78i5e/k8EKm22Rw0bgZXJX9LsMie5ZO1+FEvp2qiGshzhp06FeA9G8NCTnFo8ROIlGeiePDY5tZIcX93QfFP4tXfVePJu7dG/2zLeEu0EjVyzMWpIly/DGGyL1EQeDHgqU2IjhBuESgPgdM+8jSGC7jsYmkynQxk1/EwPlSEIDtLtfWTooPMF1k3RpbnMs0U1PxougXvxcBEWzns1r66Cjp/syezi5GSYXGTP07F03wOfG3ZeMZ4KvpTSPOxKXfVFHbQjavc3CGg67q/Bm9nrIFJhidexYj8pWULR8rwZICSxJIBAuj0sIvvovgQsNUV azureuser@HaProxy"
}

### === FIN DES CLÉS SSH  === ####