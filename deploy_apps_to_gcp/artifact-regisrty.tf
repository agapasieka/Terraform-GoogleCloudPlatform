resource "google_artifact_registry_repository" "devops_repo" {
  location      = var.region
  repository_id = "devops-repo"
  description   = "Docker repository"
  format        = "DOCKER"
}