variable "instance_network_external_name" {
  type    = string
}

variable "instance_network_external_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "instance_image_id" {
  type = string
  default = "8fca8cb4-b4aa-4137-9dc1-f20b42f83078" # Debian 13
}

variable "instance_flavor_name" {
  type    = string
  default = "a1-ram2-disk20-perf1"
}

variable "instance_security_groups" {
  type    = list(any)
  default = ["default"]
}

variable "instance_key_pair" {
  type = string
}

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}

variable "instance_network_internal" {
  type    = string
}

variable "instance_count" {
  type = number
  default = 1
}

variable "public_floating_ip" {
  type = bool
  default = false
}

variable "public_floating_ip_fixed" {
  type = string
  default = ""
}

variable "instance_internal_fixed_ip" {
  type = string
  default = ""
}
