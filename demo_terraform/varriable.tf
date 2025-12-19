variable "container_name" {
  description = "Name of the Docker container"
  type        = string
  default     = "backend"
}

variable "image_name" {
  description = "Name of the Docker image"
  type        = string
  default     = "backend-app"
}

variable "external_port" {
  description = "External port to expose the application"
  type        = number
  default     = 8080
}

variable "internal_port" {
  description = "Internal port the application runs on"
  type        = number
  default     = 8080
}
