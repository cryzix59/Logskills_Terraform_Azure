# Logskills_Terraform_Azure
Terraform code (Azure) for Logskills project at ESIEE School

# Cloud Architecture

Optimal architecture desired 
![Optimal architecture](https://raw.githubusercontent.com/etienneplagnieux/Logskills_Terraform_Azure/ebc0fc44f93d528eb2f5edae238c7809ebb47c5a/img/Logskills_Architecture_HA.svg?token=AO46RG2TNG3O4AN362TAKETAMHF2E)


# Running project
To run the project, you need the Terraform and Azure CLI installed on our computer

-- First Step : prerequisite
Install Azure CLI, like this tutoral : 
https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli

-- Second step : initialization
Run terraform init to initialize the project and dependancies 
After, charge our own SSH Keys

-- Third Step : deployment
After, you can run terraform apply 
All ressources will be created by Terraform without actions
