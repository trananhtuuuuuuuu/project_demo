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
  keep_locally = false # Delete the image when you run terraform destroy
}

resource "docker_container" "backend" {
  image = docker_image.backend_app.name # Links ti the image resource
  name  = var.container_name # This is name of container

  ports {
    internal = var.internal_port # port inside container
    external = var.external_port # port on host machine
  }

  restart = "unless-stopped" # auto-restart if container crasher

}
