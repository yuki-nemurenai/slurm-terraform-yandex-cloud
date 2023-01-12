data "yandex_compute_image" "this" {
  family = var.image_family
}
resource "yandex_compute_instance" "this" {
  count	      = var.vm_count
  name        = "${local.resource_name}-${var.vm_name}-${count.index}"
  platform_id = "standard-v1"
  zone        = var.az[count.index % length(var.az)]
  labels      = var.labels

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.this.id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.this[var.az[count.index % 3]].id
    nat      = true
  }

  metadata = {
    ssh-keys = var.public_ssh_key_path != "" ? var.public_ssh_key_path : "yc-user:${tls_private_key.rsa_key[0].public_key_openssh}" 
  }
  allow_stopping_for_update = true
}

