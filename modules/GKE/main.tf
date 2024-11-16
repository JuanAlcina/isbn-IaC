# Crear una red para el clúster
resource "google_compute_network" "isbn_gke_network" {
  name = "isbn-gke-network"
}

# Crear un subred para el clúster
resource "google_compute_subnetwork" "isbn_gke_subnetwork" {
  name          = "isbn-gke-subnetwork"
  ip_cidr_range = "10.0.0.0/16"
  region        = var.region
  network       = google_compute_network.isbn_gke_network.name
}

# Configuración del clúster de GKE
resource "google_container_cluster" "isbn_primary" {
  name     = "isbn-gke-cluster"
  location = var.region
  deletion_protection = false

  # Red y subred
  network    = google_compute_network.isbn_gke_network.name
  subnetwork = google_compute_subnetwork.isbn_gke_subnetwork.name

  # Configuración de los nodos
  initial_node_count = 1

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}

# Obtener credenciales para el clúster
output "kubeconfig" {
  value = google_container_cluster.isbn_primary.endpoint
  description = "URL del endpoint del clúster de GKE"
}