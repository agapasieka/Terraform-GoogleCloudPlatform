In this lab you will build a Docker container image from provided code and a Dockerfile using Cloud Build. You will then upload the container to the Artifact Registry.

## Enable APIs
  ```sh
  gcloud services enable \
  cloudbuild.googleapis.com \
  artifactregistry.googleapis.com
  ```
2. Building containers with DockerFile and Cloud Build

2.1. Create quickstart.sh file which will represent an application inside the container
  ```sh
    cat <<EOF > quickstart.sh
    #!/bin/sh
    echo "Hello, world! The time is $(date)."
    EOF
  ```  

2.2. Create Dockerfile file and use it as a build configuration script with Cloud Build
  ```sh
    cat <<EOF > Dockerfile
    FROM alpine
    COPY quickstart.sh /
    CMD ["/quickstart.sh"]
    EOF
  ```
  
