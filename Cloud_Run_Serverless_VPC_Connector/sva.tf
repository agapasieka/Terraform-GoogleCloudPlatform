resource "google_service_account" "testvm_service_account" {
  account_id   = "testvm-service-account"
  display_name = "Dedicated sva to invoke Cloud Run service"
  project      = var.project_id
}
resource "google_service_account" "cloudrun_service_account" {
  account_id   = "cloudrun-service-account"
  display_name = "Dedicated sva for Cloud Run service"
  project      = var.project_id
}

