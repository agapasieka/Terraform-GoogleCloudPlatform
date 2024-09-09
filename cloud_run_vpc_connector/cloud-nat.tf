# New Router #
resource "google_compute_router" "default" {
  provider = google-beta
  name     = "${var.company_name}-router"
  network  = module.vpc.network_self_link
  region   = var.region
}
# Reserve a Static IP #
resource "google_compute_address" "default" {
  provider = google-beta
  name     = "${var.company_name}-ip-addr"
  region   = var.region
}
# Create a Cloud Nat GW #
module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~>1.3.0"
  name                               = "${var.company_name}-nat"
  project_id                         = var.project_id
  region                             = var.region
  router                             = google_compute_router.default.name
  network                            = var.network
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  nat_ip_allocate_option             = false
  nat_ips                            = google_compute_address.default.*.self_link
  min_ports_per_vm                   = "1024"
  log_config_enable                  = "true"
  log_config_filter                  = "ERRORS_ONLY"
}
# Output Cloud Nat IP
output "cloud_nat_static_ip" {
  description = "Cloud Nat Static IP"
  value       = google_compute_address.default.address
}