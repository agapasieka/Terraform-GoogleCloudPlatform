# Regional External IP module
module "address" {
  source       = "terraform-google-modules/address/google"
  version      = "3.0.0"
  project_id   = var.project_id
  region       = var.region
  address_type = "EXTERNAL"
  names = [
    "${var.company_name}-nat-ip-addr-1"
  ]
}

# Cloud NAT module
module "cloud_nat" {
  source                              = "terraform-google-modules/cloud-nat/google"
  version                             = "~> 1.2"
  name                                = "${var.company_name}-nat"
  project_id                          = var.project_id
  region                              = var.region
  create_router                       = "true"
  router                              = "${var.company_name}-router"
  network                             = var.network
  source_subnetwork_ip_ranges_to_nat  = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option              = false
  nat_ips                             = tolist("${module.address.names}")
  enable_endpoint_independent_mapping = "true"
  min_ports_per_vm                    = "1024"
  log_config_enable                   = "true"
  log_config_filter                   = "ERRORS_ONLY"
  depends_on                          = [module.vpc]
}
