# Backend varriables
container_name = "backend"
image_name     = "backend-app"
external_port  = 8080
internal_port  = 8080

# This file provides actual values for your Terraform variables
# it's where you set the specific configuration for your deployment.



# PostgreSQL configuration
postgres_container_name = "postgreSQL_db"
postgres_image          = "postgres:16"
postgres_port           = 5432
postgres_db             = "db"
postgres_user           = "postgres"
postgres_password       = "hot_boy_Ben_Tre"