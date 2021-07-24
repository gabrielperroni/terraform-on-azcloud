# Please use terraform v12.29 to start with for all labs, I will use terraform v13 and v14 from lab 7.5 onwards
provider "azurerm" {
  features {}
}

resource "azurerm_linux_virtual_machine_scale_set" "deployment" {
  name                = "buildagent-linux-vmss"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sku                 = "Standard_DS2_v2"
  instances           = 1 #var.numberOfWorkerNodes # number of instances

  overprovision          = false
  single_placement_group = false

  admin_username = "adminuser"
  admin_password = "@@cfchildren2121" #azure.vault

  disable_password_authentication = false

  custom_data = base64encode(data.local_file.cloudinit.content)

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadOnly"

    diff_disk_settings {
      option = "Local"
    }
  }

  network_interface {
    name    = "buildagent-linux-nic" #${local.prefix}-vmss-nic"
    primary = true

    ip_configuration {
      name      = "buildagent-linux-ipconfig" #"${local.prefix}-vmss-"
      primary   = true
      subnet_id = data.azurerm_subnet.subnet.id
    }
  }

  boot_diagnostics {
    storage_account_uri = null
  }
  
  lifecycle {
    ignore_changes = [
      extension,
      tags,
      automatic_instance_repair,
      automatic_os_upgrade_policy,
      instances,
      
    ]
  }
}

# Data template Bash bootstrapping file
data "local_file" "cloudinit" {
  filename = "${path.module}/cloudinit.conf"
}
