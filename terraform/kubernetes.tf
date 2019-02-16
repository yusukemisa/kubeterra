provider "google" {
  project = "${local.project}"
  region = "${local.region}"
  zone = "${local.zone}"
  credentials = "${local.credentials}"
}

resource "google_container_cluster" "cluster" {
  name = "${local.kubernetes["name"]}"
  initial_node_count = 1

  network = "${google_compute_network.vpc_network.self_link}"
  enable_legacy_abac = true
}

resource "google_compute_network" "vpc_network" {
  name = "${local.network["name"]}"
  auto_create_subnetworks = "true"
}