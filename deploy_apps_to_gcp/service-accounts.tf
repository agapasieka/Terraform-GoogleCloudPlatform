# # Create a service account
# resource "google_service_account" "gke_sva" {
#   account_id   = "gke-sva"
#   display_name = "gke-sva"
# }

# resource "google_project_iam_member" "artifact_registry_reader" {
#   project = var.project_id
#   role    = "roles/artifactregistry.reader"
#   member  = "serviceAccount:gke-sva@${var.project_id}.iam.gserviceaccount.com"
# }
