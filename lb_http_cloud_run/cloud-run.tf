module "cloud_run" {
  source  = "GoogleCloudPlatform/cloud-run/google"
  version = "~> 0.12.0"

  service_name           = "cloud-run-example"
  project_id             = var.project_id
  location               = var.region
  image                  = "gcr.io/cloudrun/hello"
}

resource "google_cloud_run_service_iam_member" "public-access" {
  location = google_cloud_run_service.default.location
  project  = google_cloud_run_service.default.project
  service  = google_cloud_run_service.default.name
  role     = "roles/run.invoker"
  member   = "allUsers"
}

#resource "google_cloud_run_service" "default" {
  #name     = "example"
  #location = var.region
  #project  = var.project_id

  #template {
    #spec {
      #containers {
        #image = "gcr.io/cloudrun/hello"
      #}
    #}
  #}
  #metadata {
    #annotations = {
      # For valid annotation values and descriptions, see
      # https://cloud.google.com/sdk/gcloud/reference/run/deploy#--ingress
      #"run.googleapis.com/ingress" = "all"
    #}
  #}
#}
