
# Backend service container deployment
terraform {
  required_version = ">= 1.0" # version of terraform
  required_providers {
    docker = {
      source  = "kreuzwerker/docker" # where contain source code of docker
      version = "~> 3.0" # version of docker
    }
  }
}

provider "docker" {} # Allows Terraform to manage Docker resources

resource "docker_image" "backend_app" { # this tells terraform know which Docker image to use
  name         = "${var.image_name}:latest" # Uses variable from terraform.tfvars file
  keep_locally = true # Delete the image when you run terraform destroy
}

resource "docker_container" "backend" {
  image = docker_image.backend_app.name # Links ti the image resource
  name  = var.container_name # This is name of container

  ports {
    internal = var.internal_port # port inside container
    external = var.external_port # port on host machine
  }

  networks_advanced {
    name = docker_network.app_network.name
  }

  # This ensures DB starts before Backend
  depends_on = [docker_container.postgres]

  restart = "unless-stopped" # auto-restart if container crasher

}














# PostgreSQL database container deployment

# PostgreSQL Image
resource "docker_image" "postgres" {
  name         = var.postgres_image
  keep_locally = true # don't delete images when use terraform destroy
}

# PostgreSQL Volume (for data persistence)
resource "docker_volume" "postgres_data" {
  name = "postgres_data"
}

# PostgreSQL Container
resource "docker_container" "postgres" {
  image = docker_image.postgres.name
  name  = var.postgres_container_name

  ports {
    internal = var.postgres_port
    external = var.postgres_port
  }

  env = [
    "POSTGRES_DB=${var.postgres_db}",
    "POSTGRES_USER=${var.postgres_user}",
    "POSTGRES_PASSWORD=${var.postgres_password}"
  ]

  volumes {
    volume_name    = docker_volume.postgres_data.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = docker_network.app_network.name
  }

  restart = "unless-stopped"
}













# config network
resource "docker_network" "app_network" {
  name = "backend_db_network"
}
