resource "null_resource" "docker_commands" {
  provisioner "local-exec" {
    command = "docker tag banca_wa us-east4-docker.pkg.dev/masteris1/banca_wa/banca_wa"
  }

  provisioner "local-exec" {
    command = "docker push us-east4-docker.pkg.dev/masteris1/banca_wa/banca_wa"
  }
}