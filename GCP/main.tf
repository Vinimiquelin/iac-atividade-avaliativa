terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("chave.json")

  project = "mack-pos-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "MinhaVM" {
    name = "minhavm"
    machine_type = "e2-micro"
    zone = "us-central1-c"

    boot_disk {
        initialize_params{
            image = "debian-cloud/debian-10"
        }
    }

    network_interface {
        network = "default"
        access_config {
            // Ephemeral public IP
        }
    }

    # Test to create a .txt file on VM startup
    # metadata_startup_script = "echo oi > /teste.txt"
}