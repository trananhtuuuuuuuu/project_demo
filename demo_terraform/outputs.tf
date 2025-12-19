output "container_id" {
  description = "ID of the Docker container"
  value       = docker_container.backend.id
}

output "container_name" {
  description = "Name of the Docker container"
  value       = docker_container.backend.name
}

output "application_url" {
  description = "URL to access the application"
  value       = "http://localhost:${var.external_port}"
}

output "container_status" {
  description = "Status of the Docker container"
  value       = docker_container.backend.must_run
}
