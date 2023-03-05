resource "google_compute_firewall" "iap_allow_ssh" {
  depends_on = [module.vpc.network_name]
  name       = "iap-allow"
  network    = var.network
  project    = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [
    "35.235.240.0/20"
  ]

  target_tags = [
    "iap"
  ]



}