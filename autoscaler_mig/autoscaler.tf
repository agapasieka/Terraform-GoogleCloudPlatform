resource "google_compute_autoscaler" "default" {
  provider = google-beta
  name     = "my-autoscaler"
  zone     = "us-central1-f"
  target   = google_compute_instance_group_manager.mig.id

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60

    scaling_schedules {
      name                  = "every-weekday-morning"
      description           = "Increase to 2 every weekday at 7AM for 12 hours."
      min_required_replicas = 2
      schedule              = "0 7 * * MON-FRI"
      time_zone             = "America/New_York"
      duration_sec          = 43200
    }
  }
}