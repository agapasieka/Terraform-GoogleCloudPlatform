# # Enable the Cloud Run API
# resource "google_project_service" "cloudrun" {
#   project = var.project_id
#   service = "run.googleapis.com"
# }

# data "google_artifact_registry_docker_image" "cloud_run_image" {
#   location      = var.region
#   repository_id = google_artifact_registry_repository.devops_repo.repository_id
#   image_name    = "cloud-run-image:v0.1"
# }

# # Deploy the Cloud Run service using the Docker image
# resource "google_cloud_run_service" "cloud_run_service" {
#   name     = "cloud-run-service"
#   location = var.region

#   template {
#     spec {
#       containers {
#         image = data.google_artifact_registry_docker_image.cloud_run_image.id
#       }
#     }
#   }

#   traffic {
#     percent         = 100
#     latest_revision = true
#   }
# }

# # Allow unauthenticated invocations
# resource "google_cloud_run_service_iam_policy" "noauth" {
#   location = google_cloud_run_service.cloud_run_service.location
#   project  = google_cloud_run_service.cloud_run_service.project
#   service  = google_cloud_run_service.cloud_run_service.name

#   policy_data = data.google_iam_policy.noauth.policy_data
# }

# data "google_iam_policy" "noauth" {
#   binding {
#     role    = "roles/run.invoker"
#     members = ["allUsers"]
#   }
# }

# # Output for Cloud Run service URL
# output "cloud_run_url" {
#   description = "The URL of the deployed Cloud Run service"
#   value       = google_cloud_run_service.cloud_run_service.status[0].url
# }
