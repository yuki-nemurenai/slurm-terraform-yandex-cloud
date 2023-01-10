variable "vm1_name" {
  type        = string
}

variable "vm2_name" {
  type        = string
}

variable "vm3_name" {
  type        = string
}

variable "labels" {
  type 	      = map(string)
}

variable "image_id" {
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

