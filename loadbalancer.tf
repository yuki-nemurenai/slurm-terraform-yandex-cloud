resource "yandex_lb_network_load_balancer" "loadbalancer" {
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
    target_group_id = "${yandex_lb_target_group.loadbalancer_group.id}"

    healthcheck {
      name   = var.healthcheck.name
      http_options {
        port   = var.healthcheck.port
        path   = var.healthcheck.path
      }
    }
  }
}

resource "yandex_lb_target_group" "loadbalancer_group" {
  name      = "lab-lb-group"
  labels    = var.labels

  target {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-a.id}"
    address   = "${yandex_compute_instance.lab-subnet-a.network_interface.0.ip_address}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-b.id}"
    address   = "${yandex_compute_instance.lab-subnet-b.network_interface.0.ip_address}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.lab-subnet-c.id}"
    address   = "${yandex_compute_instance.lab-subnet-c.network_interface.0.ip_address}"
  }

}
