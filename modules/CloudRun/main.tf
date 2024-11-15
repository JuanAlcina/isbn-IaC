# Crear un servicio de Cloud Run
resource "google_cloud_run_service" "banca_wa" {
  name     = "banca_wa"                         # Nombre del servicio de Cloud Run
  location = "us-east4"                              # Región donde se desplegará el servicio

  template {
    spec {
      containers {
        image = "us-east4-docker.pkg.dev/masteris1/banca_wa/banca_wa:latest"  # URL de la imagen de contenedor en Artifact Registry
        ports {
          container_port = 4000                      # Puerto del contenedor expuesto
        }

        resources {
          limits = {
            cpu    = "1"                             # Límite de CPU (1 vCPU)
            memory = "512Mi"                         # Límite de memoria (512 MiB)
          }
        }
      }
    }
  }

  traffic {
    percent         = 100                            # Enviar el 100% del tráfico a la última revisión
    latest_revision = true                           # Dirige el tráfico a la última revisión desplegada
  }

  autogenerate_revision_name = true                  # Habilitar la generación automática de nombres para cada revisión

  
}

# Configuración de IAM para permitir invocaciones no autenticadas
resource "google_cloud_run_service_iam_member" "allow_unauthenticated" {
  location = google_cloud_run_service.banca_wa.location  # Ubicación del servicio Cloud Run
  service  = google_cloud_run_service.banca_wa.name      # Nombre del servicio Cloud Run al que aplica el IAM
  role     = "roles/run.invoker"                             # Rol que permite invocar el servicio
  member   = "allUsers"                                      # Permitir acceso no autenticado a todos los usuarios
}
