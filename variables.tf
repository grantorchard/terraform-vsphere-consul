# ---------------------------------------------------------------------------------------------------------------------
# VMWARE DATA SOURCE VARIABLES
# These are used to discover unmanaged resources used during deployment.
# ---------------------------------------------------------------------------------------------------------------------

variable datacenter_name {
  type = string
  description = "The name of the vSphere Datacenter into which resources will be created."
}

variable cluster_name {
  type = string
  description = "The vSphere Cluster into which resources will be created."
}

variable datastore_name {
  type    = string
  description = "The vSphere Datastore into which resources will be created."
}

variable datastore_cluster_name {
  type    = string
  default = ""
}

variable vm_network_name {
  type = string
  default = 
}

variable template_name {
  type = string
}

# ---------------------------------------------------------------------------------------------------------------------
# VMWARE RESOURCE VARIABLES
# Variables used during the creation of resources in vSphere.
# ---------------------------------------------------------------------------------------------------------------------


variable drs_group_name {
  type = string
  default = "consul_anti_affinity_group"
  description = "The name of the DRS group created to keep Consul servers running on separate hosts"
}

variable hostname-prefix {
  type    = string
  default = "consul"
  description = "The prefix used for virtual machine name, and subsequently the hostname. A numeric value will be appended to this prefix."
}

# ---------------------------------------------------------------------------------------------------------------------
# CONSUL CONFIGURATION VARIABLES
# These are used to set variables within Consul configuration files stored in the templates directory.
# ---------------------------------------------------------------------------------------------------------------------


variable consul_config_path {
  type    = string
  default = "/etc/consul/config.json"
  description = "The path to the Consul configuration file."
}

variable consul_username {
  type    = string
  default = "consul"
  description = "The username under which the Consul service will be started."
}

variable consul_bin_dir {
  type    = string
  default = "/opt/consul"
  description = "The directory that the Consul binary will be extracted into."
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
  description = "If this value is true, then consul_private_key, consul_certificate and consul_caroot need to be provided"
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
  description = "Used to identify nodes that should form the Consul cluster"
}

variable consul_datacenter {
  type    = string
  default = "dc01"
}

variable distro {
  type = string
  description = "Used for identification of certain distribution specific values as part of userdata."
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

variable "vsphere_server" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}




variable password {
  type = string
}
