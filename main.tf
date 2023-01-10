resource "yandex_compute_instance" "lab-subnet-a" {
  name        = "${local.resource_name}-${var.vm1_name}"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"
  labels      = var.labels

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.lab-subnet-a.id
    nat      = true
  }

  metadata = {
    ssh-keys = var.public_ssh_key_path != "" ? var.public_ssh_key_path : "yc-user:${tls_private_key.rsa_key.public_key_openssh}" 
  }
  allow_stopping_for_update = true
}

resource "yandex_compute_instance" "lab-subnet-b" {
  name        = "${local.resource_name}-${var.vm2_name}"
  platform_id = "standard-v1"
  zone        = "ru-central1-b"
  labels      = var.labels

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.lab-subnet-b.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.public_ssh_key_path != "" ? var.public_ssh_key_path : "yc-user:${tls_private_key.rsa_key.public_key_openssh}"
  }
  allow_stopping_for_update = true
}

resource "yandex_compute_instance" "lab-subnet-c" {
  name        = "${local.resource_name}-${var.vm3_name}"
  platform_id = "standard-v1"
  zone        = "ru-central1-c"
  labels      = var.labels

  resources {
    cores  = var.resources.cpu
    memory = var.resources.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.resources.disk
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.lab-subnet-c.id
    nat       = true
  }

  metadata = {
    ssh-keys = var.public_ssh_key_path != "" ? var.public_ssh_key_path : "yc-user:${tls_private_key.rsa_key.public_key_openssh}"
  }
  allow_stopping_for_update = true
}
