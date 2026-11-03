terraform {
  required_version = ">= 0.14.0" #version de terraform
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0" #version du provider
    }
  }
}
