resource "google_compute_instance_template" "blue" {
  name           = "blue-template"
  machine_type   = "e2-medium"
  can_ip_forward = false

  tags = ["tag1", "tag2"]

  disk {
    source_image = data.google_compute_image.debian_11.id
  }

  network_interface {
    network = "default"
  }

  metadata = {
    name = "value"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}