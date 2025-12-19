# Backend service container
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




# Database container
variable "postgres_container_name" {
  description = "Name of the PostgreSQL Docker container"
  type        = string
  default     = "postgreSQL_db"
}

variable "postgres_image" {
  description = "PostgreSQL Docker image"
  type        = string
  default     = "postgres:16"
}

variable "postgres_port" {
  description = "PostgreSQL port"
  type        = number
  default     = 5432
}


variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
  default     = "db"
}


variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "postgres"
}


variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}
