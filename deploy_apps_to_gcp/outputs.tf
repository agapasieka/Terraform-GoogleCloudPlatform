# Output for App Engine service URL
output "name" {
  description = "The URL of the deployed App Engine"
  value       = google_app_engine_standard_app_version.v1.name
}
# Output for Cloud Run service URL
output "cloud_run_url" {
  description = "The URL of the deployed Cloud Run service"
  value       = google_cloud_run_service.cloud_run_service.status[0].url
}