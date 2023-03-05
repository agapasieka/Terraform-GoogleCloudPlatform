resource "google_compute_instance" "test_vm" {
  name         = "${var.company_name}-serverless-lab-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    source = google_compute_disk.test_vm_os.self_link
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnet

  }

  labels = {
    os = "linux"
  }

  tags = ["iap"]

  service_account {
    email  = google_service_account.testvm_service_account.email
    scopes = ["cloud-platform"]
  }

  depends_on = [
    module.vpc,
    google_service_account.testvm_service_account
  ]
}

# Output Test-vm name
output "test_vm_name" {
  description = "Test-vm name"
  value       = google_compute_instance.test_vm.name
}

# Output Test-vm zone
output "test_vm_zone" {
  description = "Test-vm name"
  value       = google_compute_instance.test_vm.zone
}