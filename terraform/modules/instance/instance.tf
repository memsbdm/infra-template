data "openstack_networking_subnet_ids_v2" "ext_subnets" {
  count = var.public_floating_ip ? 1 : 0
  network_id = var.instance_network_external_id
}

resource "openstack_networking_floatingip_v2" "floatip_1_random" {
  count = var.public_floating_ip  && var.public_floating_ip_fixed == "" ? var.instance_count : 0
  pool       = var.instance_network_external_name
  subnet_ids = data.openstack_networking_subnet_ids_v2.ext_subnets[0].ids
}

resource "openstack_compute_instance_v2" "instance" {
  count           = var.instance_count
  name            = "${var.instance_name}${count.index + 1}"
  image_id        = var.instance_image_id
  flavor_name     = var.instance_flavor_name
  metadata        = var.metadatas
  security_groups = var.instance_security_groups
  key_pair        = var.instance_key_pair
  network {
    name = var.instance_network_internal
    fixed_ip_v4 = var.instance_internal_fixed_ip == "" ? "" : "${var.instance_internal_fixed_ip}${count.index + 1}"
  }
}


resource "openstack_compute_floatingip_associate_v2" "fip_assoc_random" {
  count = var.public_floating_ip && var.public_floating_ip_fixed == ""? var.instance_count : 0
  floating_ip = openstack_networking_floatingip_v2.floatip_1_random[count.index].address
  instance_id = openstack_compute_instance_v2.instance[count.index].id
}

resource "openstack_compute_floatingip_associate_v2" "fip_assoc_fixed" {
  count = var.public_floating_ip_fixed != "" ? 1 : 0
  floating_ip = var.public_floating_ip_fixed
  instance_id = openstack_compute_instance_v2.instance[count.index].id
}

