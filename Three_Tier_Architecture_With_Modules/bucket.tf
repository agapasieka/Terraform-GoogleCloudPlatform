# Logs Destination Bucket Module
module "destination" {
  source                   = "terraform-google-modules/log-export/google//modules/storage"
  project_id               = var.project_id
  storage_bucket_name      = "${var.company_name}-bucket-for-logs"
  log_sink_writer_identity = module.log_export.writer_identity
  force_destroy            = "true"
  lifecycle_rules = [
    {
      action = {
        type = "Delete"
      }
      condition = {
        age                        = 365
        days_since_custom_time     = 0
        days_since_noncurrent_time = 0
        matches_storage_class      = "COLDLINE"
        num_newer_versions         = 0
        with_state                 = "ANY"
      }
    },
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "COLDLINE"
      }
      condition = {
        age                        = 180
        days_since_custom_time     = 0
        days_since_noncurrent_time = 0
        matches_storage_class      = "COLDLINE"
        num_newer_versions         = 0
        with_state                 = "ANY"
      }
    }
  ]
}