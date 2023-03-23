resource "google_compute_global_forwarding_rule" "http_fw_rule" {
  name                  = "http-fw-rule"
  ip_address            = google_compute_global_address.lb_ext_ip.self_link
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.http_proxy.self_link
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.url_map_http.self_link
}

resource "google_compute_url_map" "url_map_http" {
  name            = "url-map-http"
  default_service = google_compute_backend_service.http_backend.self_link
}

resource "google_compute_backend_service" "http_backend" {
  name          = "http-backend"
  port_name     = "http"
  protocol      = "HTTP"
  timeout_sec   = 300
  enable_cdn    = false
  health_checks = [google_compute_health_check.lb_http_hc.id]

  backend {
    group                 = google_compute_instance_group_manager.mig.instance_group
    balancing_mode        = "RATE"
    max_rate_per_instance = 2000
  }

  log_config {
    enable      = true
    sample_rate = 1
  }
}

resource "google_compute_health_check" "lb_http_hc" {
  name                = "lb-http-hc"
  check_interval_sec  = 5
  healthy_threshold   = 2
  timeout_sec         = 5
  unhealthy_threshold = 2

  http_health_check {
    port         = 80
    proxy_header = "NONE"
    request_path = "/"
  }
  log_config {
    enable = true
  }
}

output "load_balancer_external_ip" {
  description = "The external ip address of the forwarding rule for default lb."
  value       = google_compute_global_address.lb_ext_ip.address
}
