module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.12.0"

  service_name           = "cloud-run-example"
  project_id             = var.project_id
  location               = var.region
  image                  = "gcr.io/cloudrun/hello"
}
