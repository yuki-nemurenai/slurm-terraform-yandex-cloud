resource "yandex_vpc_network" "this" {
  name 	 = "${local.resource_name}-lab-net"
  labels = var.labels
}

resource "yandex_vpc_subnet" "this" {
  for_each       = toset(var.az)
  name 		 = "${local.resource_name}-${each.value}"
  v4_cidr_blocks = var.cidr_blocks[index(var.az, each.value)]
  zone           = each.value
  network_id     = "${yandex_vpc_network.this.id}"
  labels 	 = var.labels
}



