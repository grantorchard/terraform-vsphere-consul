data template_file "consul_service" {
  template = file("${path.module}/templates/consul_service")

  vars = {
    consul_config_path = var.consul_config_path
    consul_username    = var.consul_username
    consul_bin_dir     = var.consul_bin_dir
    consul_mode        = var.consul_mode
    consul_config_dir  = var.consul_config_dir
    consul_data_dir    = var.consul_data_dir
  }
}

data template_file "consul_config" {
  template = file("${path.module}/templates/config.json")
  count    = length(var.consul_ip_addresses)

  vars = {
    consul_datacenter   = var.consul_datacenter
    consul_log_level    = var.consul_log_level
    consul_node_name    = "${var.hostname-prefix}-${count.index}"
    consul_node_count   = length(var.consul_ip_addresses)
    consul_https_port   = var.consul_https_port
    consul_http_port    = var.consul_http_port
    enable_tls          = var.enable_tls
    consul_private_key  = var.consul_private_key
    consul_certificate  = var.consul_certificate
    consul_caroot       = var.consul_caroot
    consul_ip_address   = var.consul_ip_addresses[count.index]
    consul_ip_addresses = jsonencode(var.consul_ip_addresses)
    consul_enable_ui    = var.consul_enable_ui
  }
}

data template_file "userdata" {
  count    = length(var.consul_ip_addresses)
  template = file("${path.module}/templates/userdata.yaml")

  vars = {
    username           = var.consul_username
    ssh_public_key     = file(var.ssh_public_key)
    consul_service     = base64encode(data.template_file.consul_service.rendered)
    consul_config      = base64encode(data.template_file.consul_config.*.rendered[count.index])
    consul_config_path = var.consul_config_path
    consul_bin_dir     = var.consul_bin_dir
    consul_data_dir    = var.consul_data_dir
    ip_address         = var.consul_ip_addresses[count.index]
    distro             = var.distro
  }
}


data template_cloudinit_config "userdata" {
  count         = length(var.consul_ip_addresses)
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.userdata.*.rendered[count.index]
  }
}


data template_file "metadata" {
  count    = length(var.consul_ip_addresses)
  template = file("${path.module}/templates/metadata.yaml")
  vars = {
    ip_address     = var.consul_ip_addresses[count.index]
    netmask        = var.netmask
    nameservers    = yamlencode(var.nameservers)
    gateway        = var.gateway
    hostname       = "${var.hostname-prefix}-${count.index}"
    ssh_public_key = file(var.ssh_public_key)
  }
}