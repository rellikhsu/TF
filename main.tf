# Create a single Compute Engine instance
provider "google" {
  project = "terraform-test-392817"
  region  = "us-west1"
}

#data "google_compute_network" "default" {
#  name = "default"
#}
#
#data "google_compute_subnetwork" "default" {
#  name     = "default"
#  network  = data.google_compute_network.default.self_link
#}

resource "google_compute_instance" "default" {
  name         = "terraform-vm-1"
  machine_type = "e2-small"
  zone = "us-west1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  metadata_startup_script = "${file("./script-linux.sh")}"
  network_interface {
  	network = "default"
  }

}
