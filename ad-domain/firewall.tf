resource "google_compute_firewall" "allow_internal_ports" {
  name    = "allow-internal-ports"
  network = module.vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["1-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.1.0.0/24", "10.2.0.0/24"]
}

resource "google_compute_firewall" "allow_rdp" {
  name    = "allow-rdp"
  network = module.vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
}