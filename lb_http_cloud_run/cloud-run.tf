## Private Cloud Run Service allowing unauthenticated invocations, accesible via HTTP Load Balancer
module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.12.0"

  service_name = "cloudrun-example-tf"
  project_id   = var.project_id
  location     = var.region
  image        = "gcr.io/cloudrun/hello"
  members      = ["allUsers"]
  service_annotations = {
    "run.googleapis.com/ingress" = "internal-and-cloud-load-balancing"
  }
}
