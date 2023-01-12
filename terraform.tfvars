vm_name = "vm"

image_family = "ubuntu-2204-lts"

labels = {
  "project" = "slurm"
  "env"     = "lab"
}

cidr_blocks = [
  ["172.20.0.0/27"],
  ["172.21.0.0/27"],
  ["172.22.0.0/27"],
]

resources = {
  disk = 10
  cpu = 2
  memory = 4
}

listener = {
  name = "lab-listener"
  port = 80
}

healthcheck = {
  name = "lab-hc"
  port = 80
  path = "/"
}

public_ssh_key_path = ""

vm_count = 5
