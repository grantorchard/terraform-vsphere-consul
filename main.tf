provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource vsphere_virtual_machine "this" {
  count            = length(var.consul_ip_addresses)
  name             = "${var.hostname-prefix}-${count.index}"
  resource_pool_id = data.vsphere_compute_cluster.this.resource_pool_id
  datastore_id     = data.vsphere_datastore.this.id

  num_cpus = 2
  memory   = 1024
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id   = data.vsphere_network.this.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  wait_for_guest_net_timeout = 0

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  extra_config = {
    "guestinfo.metadata"          = base64encode(data.template_file.metadata.*.rendered[count.index])
    "guestinfo.metadata.encoding" = "base64"
    "guestinfo.userdata"          = base64encode(data.template_file.userdata.*.rendered[count.index])
    "guestinfo.userdata.encoding" = "base64"
  }
}

resource vsphere_compute_cluster_vm_anti_affinity_rule "this" {
  name                = var.drs_group_name
  compute_cluster_id  = data.vsphere_compute_cluster.this.id
  virtual_machine_ids = vsphere_virtual_machine.this.*.id
}