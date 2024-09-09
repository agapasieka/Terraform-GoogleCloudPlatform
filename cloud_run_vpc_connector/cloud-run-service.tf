# Enable Cloud Run API
resource "google_project_service" "run" {
  provider           = google-beta
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

# Create Cloud Run service
resource "google_cloud_run_service" "cloudrun_srv" {
  name                       = "cloudrun-private"
  location                   = var.region
  project                    = var.project_id
  autogenerate_revision_name = true

  metadata {
    annotations = {
      "run.googleapis.com/ingress" = "internal"
    }
  }

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale" = "1"
        "autoscaling.knative.dev/maxScale" = "5"
        "run.googleapis.com/vpc-access-connector" = "" ##  Paste your vpc connector here 
        ##  Forward all egress traffic through vpc connector 
        "run.googleapis.com/vpc-access-egress" = "all-traffic"
      }
    }
    spec {
      service_account_name = google_service_account.cloudrun_service_account.email
      containers {
        image = "" ## Paste your image here
      }

    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "invoker" {
  depends_on = [google_service_account.testvm_service_account]
  location   = google_cloud_run_service.cloudrun_srv.location
  project    = google_cloud_run_service.cloudrun_srv.project
  service    = google_cloud_run_service.cloudrun_srv.name
  role       = "roles/run.invoker"
  members = [
    "serviceAccount:${google_service_account.testvm_service_account.email}",
  ]

}

# Output Cloud Run Service url
output "cloud_run_service_url" {
  description = "Cloud Run Service url"
  value       = google_cloud_run_service.cloudrun_srv.status.0.url
}


