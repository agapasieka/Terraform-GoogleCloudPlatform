# MIG module
module "vm_mig" {
  source              = "terraform-google-modules/vm/google//modules/mig"
  version             = "8.0.0"
  project_id          = var.project_id
  region              = var.region
  hostname            = "web"
  mig_name            = "${var.company_name}-mig-1"
  instance_template   = module.vm_instance_template.self_link
  autoscaling_enabled = true
  autoscaler_name     = "${var.company_name}-autoscaler"
  autoscaling_cpu = [
    {
      target            = 0.8
      predictive_method = "NONE"
    }
  ]
  cooldown_period = 120
  min_replicas    = 2
  max_replicas    = 5
  named_ports = [
    {
      name = "http"
      port = 80
    }
  ]
  target_size  = 2
  target_pools = []
}
