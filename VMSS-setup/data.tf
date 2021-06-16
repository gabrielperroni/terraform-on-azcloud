data "azurerm_resource_group" "rg" {
  name     = "TF-AGENT-SCALESET"
}

data "azurerm_virtual_network" "vnet" {
name                = "vnet-tr-shared"
resource_group_name = "tr-shared-rg"
}

data "azurerm_subnet" "subnet" {
 name                 = "default-tr-shared-snet"
 resource_group_name  = "tr-shared-rg" #azurerm_resource_group.vmss.name
 virtual_network_name = data.azurerm_virtual_network.vnet.name
}