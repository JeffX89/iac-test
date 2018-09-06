resource "google_compute_instance" "raddit" {
  name         = "raddit-instance"
  machine_type = "n1-standard-1"
  zone         = "europe-west1-b"

  # boot disk specifications
  boot_disk {
    initialize_params {
      image = "raddit-base" // use image built with Packer
    }
  }



  # networks to attach to the VM
  network_interface {
    network = "default"
    access_config {} // use ephemaral public IP
  }
}

resource "google_compute_project_metadata" "raddit" {
    metadata {
      ssh-keys = "testkey:${file("~/.ssh/testkey.pub")}" // path to ssh key file
    }
}