# Storage bucket for Cloud Build to store temp logs and staging build files
resource "google_storage_bucket" "bucket" {
  force_destroy               = true
  location                    = var.region
  name                        = "${var.project_id}-bucket"
  project                     = var.project_id
  public_access_prevention    = "inherited"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  lifecycle {
    prevent_destroy = false
  }

}
resource "google_storage_bucket_object" "temp_logs" {
  name         = "temp-logs"
  content      = "Data as string to be uploaded"
  content_type = "text/plain"
  bucket       = google_storage_bucket.bucket.id

}
