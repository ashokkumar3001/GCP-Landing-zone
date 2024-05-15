resource "google_organization_policy" "restrict_vm_external_ip" {
  org_id     = var.org_id
  constraint = "constraints/compute.vmExternalIpAccess"
  list_policy {
    deny {
      all = true
    }
  }
}

resource "google_organization_policy" "restrict_source_code_download" {
  org_id     = var.org_id
  constraint = "constraints/appengine.disableCodeDownload"
  boolean_policy {
    enforced = true
  }
}
resource "google_organization_policy" "restrict_service_account_key_creation" {
  org_id     = var.org_id
  constraint = "constraints/iam.disableServiceAccountKeyCreation"
  boolean_policy {
    enforced = true
  }
}
