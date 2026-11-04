data "openstack_networking_subnet_ids_v2" "ext_subnets" {
  network_id = var.instance_network_external_id
}

resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool       = var.instance_network_external_name
  subnet_ids = data.openstack_networking_subnet_ids_v2.ext_subnets.ids
}

resource "openstack_compute_instance_v2" "instance" {
  name            = var.instance_name
  image_id        = var.instance_image_id
  flavor_name     = var.instance_flavor_name
  metadata        = var.metadatas
  security_groups = var.instance_security_groups
  key_pair        = var.instance_key_pair
  network {
    name = var.instance_network_internal
  }
}

resource "openstack_compute_floatingip_associate_v2" "fip_assoc" {
  floating_ip = openstack_networking_floatingip_v2.floatip_1.address
  instance_id = openstack_compute_instance_v2.instance.id
}
