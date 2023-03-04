resource "google_compute_instance_group_manager" "mig" {

  name = "my-igm"
  zone = "us-central1-f"

  version {
    instance_template = google_compute_instance_template.blue.id
    name              = "primary"
  }

  base_instance_name = "mig-autoscaler"
}

data "google_compute_image" "debian_11" {

  family  = "debian-11"
  project = "debian-cloud"
}