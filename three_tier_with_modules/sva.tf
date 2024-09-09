# sva module
module "service-accounts" {
  source       = "terraform-google-modules/service-accounts/google"
  version      = "4.2.0"
  project_id   = var.project_id
  names        = ["mig-sva"]
  prefix       = var.company_name
  display_name = "vm-mig-sva"
  description  = "Dedicated sva for managed instance group"
}


