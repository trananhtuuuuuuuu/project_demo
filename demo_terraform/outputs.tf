# Backend service container output
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



# PostgreSQL database container outputs
output "postgres_container_id" {
  description = "ID of the PostgreSQL container"
  value       = docker_container.postgres.id
}

output "postgres_container_name" {
  description = "Name of the PostgreSQL container"
  value       = docker_container.postgres.name
}

output "postgres_connection_url" {
  description = "JDBC URL for PostgreSQL"
  value       = "jdbc:postgresql://localhost:${var.postgres_port}/${var.postgres_db}"
}

output "postgres_credentials" {
  description = "PostgreSQL credentials"
  value = {
    username = var.postgres_user
    database = var.postgres_db
  }
  sensitive = false
}

