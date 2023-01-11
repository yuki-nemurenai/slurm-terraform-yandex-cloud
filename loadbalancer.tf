resource "yandex_lb_network_load_balancer" "this" {
  name = "${local.resource_name}-lab-lb"
  labels = var.labels

  listener {
    name = var.listener.name
    port = var.listener.port
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.this.id}"

    healthcheck {
      name   = var.healthcheck.name
      http_options {
        port   = var.healthcheck.port
        path   = var.healthcheck.path
      }
    }
  }
}

resource "yandex_lb_target_group" "this" {
  name      = "lab-lb-group"
  labels    = var.labels

  target {
    subnet_id = yandex_vpc_subnet.this[0].id
    address   = yandex_compute_instance.this[0].network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.this[1].id
    address   = yandex_compute_instance.this[1].network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.this[2].id
    address   = yandex_compute_instance.this[2].network_interface.0.ip_address
  }
}
