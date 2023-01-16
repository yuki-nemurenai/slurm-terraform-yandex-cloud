variable "vm_name" {
  type        = string
}

variable "labels" {
  type 	      = map(string)
}

variable "image_family" {
  type        = string
}

variable "cidr_blocks" {
  type	      = list(list(string))
}

variable "resources" {
  type = object({
    disk = number
    cpu = number
    memory = number
  })
}

variable "listener" {
  type = object({
    name = string
    port = number
  })
}

variable "healthcheck" {
  type = object({
    name = string
    port = number
    path = string
  })
}

variable "public_ssh_key_path" {
  type = string
  default = ""
}

variable "private_ssh_key_path" {
  type = string
  default = ""
}

variable "az" {
  type = list(string)
  default = [
    "ru-central1-a",
    "ru-central1-b",
    "ru-central1-c"
  ]
}

variable "vm_count" {
  type = number
}
