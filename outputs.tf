output "internal_ips" {
  value = yandex_compute_instance.this[*].network_interface.0.ip_address
}

output "external_ips" {
  value = yandex_compute_instance.this[*].network_interface.0.nat_ip_address
}

output "loadbalancer_external_ip" {
  value = tolist(tolist(yandex_lb_network_load_balancer.this.listener).0.external_address_spec).0.address
}

output "private_ssh_key" {
  value = var.public_ssh_key_path != "" ? "" : tls_private_key.rsa_key[0].private_key_openssh
  sensitive = true
}
