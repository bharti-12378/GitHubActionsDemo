provider "google" {
  project = "qwiklabs-gcp-03-e6274714b80d"
  region  = "us-central1"
}

resource "google_storage_bucket" "example_bucket" {
  name          = "example-qwiklabs-gcp-03-e6274714b80d-gcs-bucket"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365 # Deletes objects older than 1 year
    }
  }
}

output "bucket_name" {
  value = google_storage_bucket.example_bucket.name
}
