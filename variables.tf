variable consul_config_path {
  type    = string
  default = "/etc/consul/config.json"
}
variable consul_username {
  type    = string
  default = "consul"
}
variable consul_bin_dir {
  type    = string
  default = "/opt/consul"
}
variable consul_mode {
  type    = string
  default = "server"
}
variable consul_config_dir {
  type    = string
  default = "/etc/consul"
}
variable consul_data_dir {
  type    = string
  default = "/opt/consul/data"
}
variable consul_log_level {
  type    = string
  default = "INFO"
}
variable hostname-prefix {
  type    = string
  default = "consul"
}
variable consul_https_port {
  type    = string
  default = "8501"
}
variable consul_http_port {
  type    = string
  default = "8500"
}
variable enable_tls {
  type    = string
  default = "false"
}
variable consul_private_key {
  type    = string
  default = ""
}
variable consul_certificate {
  type    = string
  default = ""
}
variable consul_caroot {
  type    = string
  default = ""
}
variable consul_enable_ui {
  type    = string
  default = "true"
}

variable consul_ip_addresses {
  type    = list
  default = []
}

variable consul_datacenter {
  type    = string
  default = "dc01"
}

variable distro {
  type = string
}

variable ssh_public_key {
  type = string
}
variable netmask {
  type        = string
  description = "Number of bits in the netmask (eg 24 for 255.255.255.0)"
}
variable gateway {
  type = string
}
variable nameservers {
  type = list
}

variable domain {
  type = string
}


variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}

variable datacenter_name {
  type = string
}

variable cluster_name {
  type = string
}

variable datastore_name {
  type    = string
  default = ""
}

variable datastore_cluster_name {
  type    = string
  default = ""
}

variable vm_network_name {
  type = string
}


variable template_name {
  type = string
}

variable drs_group_name {
  type = string
}

variable password {
  type = string
}
