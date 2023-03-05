# Instance Template module
module "vm_instance_template" {
  source      = "terraform-google-modules/vm/google//modules/instance_template"
  version     = "8.0.0"
  project_id  = var.project_id
  region      = var.region
  network     = var.network
  subnetwork  = var.subnet
  name_prefix = var.company_name
  depends_on  = [module.vpc]
  labels = {
    os = "linux"
  }
  machine_type        = "n1-standard-1"
  auto_delete         = true
  disk_size_gb        = 20
  disk_type           = "pd-ssd"
  source_image_family = "projects/debian-cloud/global/images/family/debian-11"
  metadata = {
    "startup-script" = file("startup.sh")
  }

  service_account = {
    email = module.service-accounts.email
    scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
  tags = var.tags

}

