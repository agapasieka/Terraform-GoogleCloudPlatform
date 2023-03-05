output "names" {
  value = ["${module.address.names}"]
}

output "instance_group" {
  description = "URI of the instance group."
  value       = module.vm_mig.instance_group
}

output "load_balancer_default_ip" {
  description = "The external ip address of the forwarding rule for default lb."
  value       = module.lb-http.external_ip
}