resource "google_compute_instance_group_manager" "mig" {
  name               = substr("${var.company_name}-mig-${md5(google_compute_instance_template.green.name)}", 0, 20)
  base_instance_name = "web"
  zone               = var.zone
  #region             = var.region
  target_size        = 3
  wait_for_instances = true

  version {
    instance_template = google_compute_instance_template.green.id
  }

  timeouts {
    create = "15m"
    update = "15m"
  }

  named_port {
    name = "http"
    port = 80
  }

  lifecycle {
    create_before_destroy = true
  }
}