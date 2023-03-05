# HTTP LB module
module "lb-http" {
  source            = "GoogleCloudPlatform/lb-http/google"
  version           = "6.3.0"
  project           = var.project_id
  name              = "${var.company_name}-http-lb"
  firewall_networks = [var.network]
  target_tags       = var.tags
  create_address    = true
  ssl               = false
  backends = {
    default = {

      description                     = null
      protocol                        = "HTTP"
      port                            = 80
      port_name                       = "http"
      timeout_sec                     = 10
      connection_draining_timeout_sec = null
      enable_cdn                      = false
      compression_mode                = "DISABLED"
      security_policy                 = null
      session_affinity                = null
      affinity_cookie_ttl_sec         = null
      custom_request_headers          = null
      custom_response_headers         = null

      health_check = {
        check_interval_sec  = 5
        timeout_sec         = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        request_path        = "/"
        port                = 80
        host                = null
        logging             = null
      }

      log_config = {
        enable      = true
        sample_rate = 1.0
      }
      groups = [
        {
          group                        = module.vm_mig.instance_group
          balancing_mode               = null
          capacity_scaler              = 1
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = null
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = 0.8
        },
      ]
      iap_config = {
        enable               = false
        oauth2_client_id     = null
        oauth2_client_secret = null
      }
    }
  }
}

