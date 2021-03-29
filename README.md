# Logskills_Terraform_Azure
Terraform code (Azure) for Logskills project at ESIEE School

# Cloud Architecture

## Optimal architecture desired 

### HaProxy Load balancing
On the optimal architecture we have two HaProxy (load balancer in front end) configured with Keepalive. Keepalive is a services that manage failover servers. Here we would like to use it for high availability on the trafic load balancing. Unfortunately, in Azure we can't use it (Azure don't support duplicate multiple private IP)

### API autoscaling groups
We deploy on each availability zone one autoscaling group (horizontal scaling). Theses servers host our API, the API is used by mobiles and watches with REST requests (PUT/GET/DELETE)

### NBD Cluster
NDB Cluster is a managing cluster for MySQL servers. For more informations 
https://mysql.developpez.com/tutoriels/manuel-de-reference-mysql-5-0/?page=Introduction-a-MySQL-Cluster


![Optimal architecture](https://github.com/etienneplagnieux/Logskills_Terraform_Azure/blob/master/img/Logskills_Architecture_HA.png)


## Architecture created (financial limits)
### One HaProxy
We deployed one load balancer

### API servers
We deployed one server per availity zone, these two servers are load balanced with HaProxy

### MySQL server
We deployed only one SQL server

![Created architecture](https://github.com/etienneplagnieux/Logskills_Terraform_Azure/blob/master/img/Logskills_Architecture_NoHA.png)



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
