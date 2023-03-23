resource "google_compute_global_address" "lb_ext_ip" {
  project      = var.project_id
  address_type = "EXTERNAL"
  name         = "lb-ext-ip"
}

resource "google_compute_address" "nat_ext_ip" {
  project      = var.project_id
  region       = var.region
  address_type = "EXTERNAL"
  name         = "nat-ext-ip"
}
