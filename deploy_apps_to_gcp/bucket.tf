# # Enable the Cloud Storage API
# resource "google_project_service" "storage" {
#   project = var.project_id
#   service = "storage.googleapis.com"
# lifecycle {
#     prevent_destroy = true
#   }
# }

# # Creates a Google Cloud Storage bucket for storing application files
# resource "google_storage_bucket" "app" {
#   name          = "${var.project_id}-${random_id.app.hex}"
#   location      = "EU"
#   force_destroy = true

#   versioning {
#     enabled = true
#   }
# }

# # Generates a random ID for appending to the bucket name to ensure uniqueness
# resource "random_id" "app" {
#   byte_length = 8
# }

# # Archives the application code from the specified directory into a zip file
# data "archive_file" "function_dist" {
#   type        = "zip"
#   source_dir  = "apps/app-engine/"
#   output_path = "apps/app-engine/app.zip"
# }

# # Uploads the application zip file to the Google Cloud Storage bucket
# resource "google_storage_bucket_object" "app" {
#   name   = "app.zip"
#   source = data.archive_file.function_dist.output_path
#   bucket = google_storage_bucket.app.name
# }

