data "google_compute_image" "debian_11" {

  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "blue" {
  name_prefix    = "blue-template-"
  machine_type   = "n1-standard-1"
  region         = var.region
  can_ip_forward = false

  tags = var.tags

  disk {
    source_image = data.google_compute_image.debian_11.id
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet
    access_config {
      network_tier = "PREMIUM"
    }
  }

  metadata = {
    "startup-script" = file("startup-blue.sh")
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = module.service-accounts.email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    module.vpc,
  ]
}

resource "google_compute_instance_template" "green" {
  name_prefix    = "green-template-"
  machine_type   = "n1-standard-2"
  region         = var.region
  can_ip_forward = false

  tags = var.tags

  disk {
    source_image = data.google_compute_image.debian_11.id
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet1
  }

  metadata = {
    "startup-script" = file("startup-green.sh")
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  service_account {
    email  = module.service-accounts.email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    module.vpc,
  ]
}