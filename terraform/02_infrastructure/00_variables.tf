variable "network_external_id" {
  type    = string
  default = "34a684b8-2889-4950-b08e-c33b3954a307"
}

variable "network_external_name" {
  type    = string
  default = "ext-floating1"
}

variable "network_internal" {
  type    = string
  default = "internal"
}

variable "network_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "ssh_public_key_default_user" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDhtIea9hEJBvZ2Z8pNt4+yHKWq2sEgvkkJgeuJA7QjQ"
}

variable "instance_image_id" {
  type    = string
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

variable "metadatas" {
  type = map(string)
  default = {
    "environment" = "dev"
  }
}
