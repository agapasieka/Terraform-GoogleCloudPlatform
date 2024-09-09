resource "google_compute_instance" "ad_dc" {
  count        = 2
  name         = "ad-dc-${count.index + 1}"
  machine_type = "e2-standard-2"
  zone         = var.zones[count.index]

  tags = ["ad-dc", "windows"]

  boot_disk {
    source = google_compute_disk.dc_boot[count.index].id
  }

  network_interface {
    network    = module.vpc.network_name
    subnetwork = "dc-subnet-${count.index + 1}"
    network_ip = count.index == 0 ? "10.1.0.100" : "10.2.0.100"
  }

  metadata = {
    windows-startup-script-ps1 = "./setup-ad.ps1"
  }

  scheduling {
    preemptible       = false
    automatic_restart = true
  }

  service_account {
    email  = google_service_account.dc_sva.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_secure_boot          = false
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
}

resource "google_compute_disk" "dc_boot" {
  count = 2
  name  = "dc-${count.index + 1}-boot"
  type  = "pd-ssd"
  zone  = var.zones[count.index]
  image = "projects/windows-cloud/global/images/windows-2022-core"
  size  = 50
}


