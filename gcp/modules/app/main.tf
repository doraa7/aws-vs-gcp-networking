resource "google_compute_instance" "frontend" {
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }
  machine_type = "e2-micro"
  name         = "frontend-${var.identifier}"
  network_interface {
    access_config {
        network_tier = "STANDARD"
    }
    network    = var.network_name
    subnetwork = var.subnetwork_name["us-central1"]
  }
  tags = [
    "frontend",
    "public"
  ]
  zone         = "us-central1-a"
}
