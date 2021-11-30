
output "public_IP"{
  value = azurerm_public_ip.myterraformpublicip.ip_address
}

output "tls_private_key" {
    value = tls_private_key.ssh_key.private_key_pem
    sensitive = false
}

output "tls_public_key" {
    value = tls_private_key.ssh_key.public_key_openssh
    sensitive = false
}

output "private_ip"{
    for_each  = toset(var.nic_name)
    value     = [azurerm_network_interface.workers_nic[each.key].id]
}