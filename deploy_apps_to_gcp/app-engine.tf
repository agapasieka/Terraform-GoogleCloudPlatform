# # Enable the App Engine Admin API
# resource "google_project_service" "appengine" {
#   project = var.project_id
#   service = "appengine.googleapis.com"
# lifecycle {
#     prevent_destroy = true
#   }
# }

# # Create the App Engine application
# resource "google_app_engine_application" "app" {
#   project     = var.project_id 
#   location_id = var.region 
# }

# resource "google_app_engine_standard_app_version" "v1" {
#   version_id = "v1"
#   service    = "default"
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


# # Output the default service URL
# output "app_engine_service_url" {
#   value = "https://${google_app_engine_standard_app_version.v1.service}-dot-${google_app_engine_application.app.project}.appspot.com"
#   description = "The URL of the App Engine service."
# }
