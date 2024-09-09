# Enable Artifact Registry API
resource "google_project_service" "artifactregistry" {
  provider           = google-beta
  service            = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}
# Artifact Registry repository to store docker image
resource "google_artifact_registry_repository" "repo" {
  format        = "DOCKER"
  location      = var.region
  project       = var.project_id
  repository_id = "images"
}