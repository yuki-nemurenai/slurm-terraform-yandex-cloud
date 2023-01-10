output "internal_ip_1" {
  value = yandex_compute_instance.lab-subnet-a.network_interface.0.ip_address
}

output "external_ip_1" {
  value = yandex_compute_instance.lab-subnet-a.network_interface.0.nat_ip_address
}

output "internal_ip_2" {
  value = yandex_compute_instance.lab-subnet-b.network_interface.0.ip_address
}

output "external_ip_2" {
  value = yandex_compute_instance.lab-subnet-b.network_interface.0.nat_ip_address
}

output "internal_ip_3" {
  value = yandex_compute_instance.lab-subnet-c.network_interface.0.ip_address
}

output "external_ip_3" {
  value = yandex_compute_instance.lab-subnet-c.network_interface.0.nat_ip_address
}

output "loadbalancer_external_ip" {
  value = tolist(tolist(yandex_lb_network_load_balancer.loadbalancer.listener).0.external_address_spec).0.address
}

output "private_ssh_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.rsa_key.private_key_openssh
  sensitive = true
}
