# Crear un Artifact Registry de tipo Docker
resource "google_artifact_registry_repository" "user_management_ms" {
  repository_id = "banca-wa"                   # ID único del repositorio en Artifact Registry
  format        = "DOCKER"                          # Tipo de repositorio: Docker
  location      = "us-east4"                        # Región donde se crea el repositorio
  mode          = "STANDARD_REPOSITORY"                        # Modo estándar; también se puede usar "VPCSC" para compatibilidad con VPC Service Controls
  description   = "Registro de contenedores Docker para el servicio de usuarios"  # Descripción del repositorio
}