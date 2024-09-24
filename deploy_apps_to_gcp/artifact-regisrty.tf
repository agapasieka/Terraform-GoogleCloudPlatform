# # Enable the Artifact Registry API
# resource "google_project_service" "artifact_registry" {
#   project = var.project_id
#   service = "artifactregistry.googleapis.com"
# }

# resource "google_artifact_registry_repository" "devops_repo" {
#   location      = var.region
#   repository_id = "devops-repo"
#   description   = "Docker repository"
#   format        = "DOCKER"
# }