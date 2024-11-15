# modules/apis/main.tf
resource "google_project_service" "iam" {
  project = var.project_id
  service = "iam.googleapis.com"
}

resource "google_project_service" "cloud_run" {
  project = var.project_id
  service = "run.googleapis.com"
}

resource "google_project_service" "firestore" {
  project = var.project_id
  service = "firestore.googleapis.com"
}

resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
}

# Habilita la API de Cloud Functions
resource "google_project_service" "cloudfunctions" {
  project = var.project_id
  service = "cloudfunctions.googleapis.com"
}

# Habilita la API de Cloud Storage para almacenar el código de la función
resource "google_project_service" "storage" {
  project = var.project_id
  service = "storage.googleapis.com"
  disable_dependent_services = true
}

# Habilita la APIs necesarias para GKE
resource "google_project_service" "container_api" {
  project = var.project_id
  service = "container.googleapis.com"
}

resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"
}

# Habilitar la API de API Gateway
resource "google_project_service" "apigateway_api" {
  project = var.project_id
  service = "apigateway.googleapis.com"
}