# # Enable the App Engine Admin API
# resource "google_project_service" "appengine" {
#   project = var.project_id
#   service = "appengine.googleapis.com"
# }

# resource "google_app_engine_standard_app_version" "v1" {
#   version_id = 1
#   service    = "hello-from-app-engine"
#   runtime    = "python39"

#   entrypoint {
#     shell = "gunicorn -b :$PORT main:app"
#   }

#   deployment {
#     zip {
#       source_url = "https://storage.googleapis.com/${google_storage_bucket.app.name}/${google_storage_bucket_object.app.name}"
#     }
#   }

#   env_variables = {
#     port = "8080"
#   }

#   manual_scaling {
#     instances = 5
#   }

#   noop_on_destroy           = true
#   delete_service_on_destroy = true
# }

# # Output for App Engine service URL
# output "name" {
#   description = "The URL of the deployed App Engine"
#   value       = google_app_engine_standard_app_version.v1.name
# }
