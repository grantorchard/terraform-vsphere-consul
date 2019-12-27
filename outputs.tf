output config {
  value = data.template_file.consul_config.*.rendered
}

output service {
  value = data.template_file.consul_service.*.rendered
}

output userdata {
  value = data.template_cloudinit_config.userdata.*.rendered
}

output metadata {
  value = data.template_cloudinit_config.metadata.*.rendered
}
