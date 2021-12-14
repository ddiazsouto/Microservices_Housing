
output "public_IP_grab"{
  value = azurerm_public_ip.myterraformpublicip.ip_address
}

output "tls_private_key" {
    value = tls_private_key.ssh_key.private_key_pem
    sensitive = false
}

output "private_ip"{
    value = azurerm_network_interface.workers_nic[*]
}