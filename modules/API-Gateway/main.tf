# Crear el API Gateway
resource "google_api_gateway_api" "isbn_api" {
  api_id = "isbn-api-gateway"
}

# Crear la configuración del API Gateway
resource "google_api_gateway_api_config" "isbn_api_config" {
  api      = google_api_gateway_api.my_api.name
  config_id = "v1"

  openapi_documents {
    path = "${path.module}/openapi-spec.yaml"
  }
}

# Desplegar un gateway
resource "google_api_gateway_gateway" "isbn_gateway" {
  gateway_id     = "isbn-gateway"
  api            = google_api_gateway_api.my_api.name
  api_config     = google_api_gateway_api_config.my_api_config.name
  region         = var.region
}