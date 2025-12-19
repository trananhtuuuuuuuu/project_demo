# project_demo

# Build Docker image
```bash
# Build the JAR file
mvn clean package

# Build Docker image
docker build -t backend-app .

```
# View All outputs after running terraform commands

```bash
cd demo_terraform
terraform output
```

## View Specific output
```bash
terraform output application_url    
terraform output container_name     
terraform output container_id       
```

# Build your application
```bash
cd demo
./mvnw clean package
```

# Build the Docker image
```bash
docker build -t backend-app:latest .
```

# Check existing of Docker images
```bash
docker images
```