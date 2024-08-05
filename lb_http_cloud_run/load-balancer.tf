module "lb-http" {
  source            = "GoogleCloudPlatform/lb-http/google//modules/serverless_negs"
  version           = "~> 11.1.0"

  project           = var.project_id
  name              = "tf-lb-c-run"

  ssl                             = false
  https_redirect                  = false
  backends = {
    default = {

      groups = [
        {
          # Your serverless service should have a NEG created that's referenced here.
          group = google_compute_region_network_endpoint_group.default.id
        }
      ]

      iap_config = {
        enable               = false
      }
      log_config = {
        enable = false
      }
    }
  }
}
