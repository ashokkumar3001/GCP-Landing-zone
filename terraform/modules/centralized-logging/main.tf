#og bucket creation : 

resource "google_logging_project_bucket_config" "analytics-enabled-bucket" {
    project          = var.network-project-name
    location         = "global"
    retention_days   = 30
    enable_analytics = true
    bucket_id        = "test-logging-ashokbucket-innominds167"
}




resource "google_logging_project_sink" "my-sink" {
  name = "testing-log-sink"
  project = var.workload-project-name
# Can export to log bucket in another project
  destination = "logging.googleapis.com/projects/${var.network-project-name}/locations/global/buckets/${google_logging_project_bucket_config.analytics-enabled-bucket.bucket_id}"
  depends_on = [resource.google_logging_project_bucket_config.analytics-enabled-bucket]
}


resource "google_project_iam_binding" "gcs-object-creator" {
  project = var.network-project-name
  role = "roles/storage.objectCreator"

  members = [
    google_logging_project_sink.my-sink.writer_identity,
  ]
}

resource "google_project_iam_binding" "gcs-bucket-writer" {
  project = var.network-project-name
  role = "roles/logging.bucketWriter"

  members = [
    google_logging_project_sink.my-sink.writer_identity,
  ]
}
