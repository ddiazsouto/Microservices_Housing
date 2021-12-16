# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# Create a resource group if it doesn't exist

resource "azurerm_resource_group" "myterraformgroup" {
    name     = "ScrapingGroup"
    location = "eastus"

    tags = {
        environment = "Scraper"
    }
}


# Create public IPs


resource "azurerm_public_ip" "myterraformpublicip" {
    name                         = "myPublicIP"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.myterraformgroup.name
    allocation_method            = "Static"

    tags = {
        environment = "${var.tag}"
    }
}


resource "azurerm_virtual_network" "main" {
  name                = "mynetwork"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myterraformgroup.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.myterraformgroup.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}



resource "azurerm_network_interface" "master_nic" {
  name                = "mynic"
  location            = azurerm_resource_group.myterraformgroup.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myterraformpublicip.id
  }
}


# Create (and display) an SSH key
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}


resource "azurerm_linux_virtual_machine" "myterraformvm" {

    name                  = "Master"
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.master_nic.id]
    size                  = "Standard_DS1_v2"

    os_disk {
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "master"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "master"
        public_key     = tls_private_key.ssh_key.public_key_openssh
    }

    tags = {
        environment = "${var.tag}"
    }
}


resource "azurerm_network_interface" "workers_nic" {
  for_each            = toset(var.nic_name)
  name                = each.value
  location            = azurerm_resource_group.myterraformgroup.location
  resource_group_name = azurerm_resource_group.myterraformgroup.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}




resource "azurerm_linux_virtual_machine" "workervm" {

    for_each              = toset(var.machine_name)
    name                  = each.key
    location              = "eastus"
    resource_group_name   = azurerm_resource_group.myterraformgroup.name
    network_interface_ids = [azurerm_network_interface.workers_nic[each.key].id]
    size                  = "Standard_DS1_v2"
    disable_password_authentication = false

    os_disk {
        caching           = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    computer_name  = "myvm"
    admin_username = "worker"
    disable_password_authentication = true

    admin_ssh_key {
        username       = "master"
        public_key     = tls_private_key.ssh_key.public_key_openssh
    }


    tags = {
        environment = "${var.tag}"
    }
}