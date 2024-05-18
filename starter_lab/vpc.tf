# vpc module
module "vpc" {
  source       = "terraform-google-modules/network/google"
  project_id   = var.project_id
  network_name = "gce-test-network"
  version      = "9.1.0"

  subnets = [

    {
      subnet_name   = "gce-test-subnet"
      subnet_ip     = "10.0.1.0/24"
      subnet_region = var.region

    },
  ]
}
