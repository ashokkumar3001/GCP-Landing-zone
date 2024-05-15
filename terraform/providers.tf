terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.8.0"
    }
  }
}

  provider "google" {
  project = "shared-vpc-project-415009"
  region  = "us-central1"
  zone    = "us-central1-c"
}
