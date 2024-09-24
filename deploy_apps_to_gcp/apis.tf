# Enable the App Engine Admin API
resource "google_project_service" "appengine" {
  project = var.project_id
  service = "appengine.googleapis.com"
}

# Enable the Cloud Storage API
resource "google_project_service" "storage" {
  project = var.project_id
  service = "storage.googleapis.com"
}

# Enable the Cloud Run API (if needed)
resource "google_project_service" "cloudrun" {
  project = var.project_id
  service = "run.googleapis.com"
}

# Enable the Artifact Registry API
resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
}

# Enable the Compute Engine API (required for VPC)
resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"
}

# Enable the Kubernetes Engine API
resource "google_project_service" "container_api" {
  project = var.project_id
  service = "container.googleapis.com"
}


