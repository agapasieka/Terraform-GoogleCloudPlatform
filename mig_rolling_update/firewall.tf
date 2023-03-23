resource "google_compute_firewall" "allow_hc" {
  project   = var.project_id
  network   = var.network
  direction = "INGRESS"
  name      = "allow-hc"
  priority  = 1000

  source_ranges = [
    "130.211.0.0/22",
    "35.191.0.0/16",
  ]
  target_service_accounts = [module.service-accounts.email]

  allow {
    ports = [
      "80",
    ]
    protocol = "tcp"
  }
  depends_on = [module.vpc]
}