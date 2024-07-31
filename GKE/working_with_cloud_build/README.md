<!-- Overview -->
## Overview
In this lab you will build a Docker container image from provided code and a Dockerfile using Cloud Build. You will then upload the container to the Artifact Registry.
Follow the steps in Cloud Shell or using local terminal of your choice. 

<!-- Task1 -->
## Enable APIs
  ```sh
  gcloud services enable \
  cloudbuild.googleapis.com \
  artifactregistry.googleapis.com
  ```

<!-- Task2 -->
## Building containers with DockerFile and Cloud Build

1. Create quickstart.sh file which will represent an application inside the container
  ```sh
    cat <<EOF > quickstart.sh
    #!/bin/sh
    echo "Hello, world! The time is $(date)."
    EOF
  ```  

2. Create Dockerfile file and use it as a build configuration script with Cloud Build
  ```sh
    cat <<EOF > Dockerfile
    FROM alpine
    COPY quickstart.sh /
    CMD ["/quickstart.sh"]
    EOF
  ```

3. Make the quickstart.sh script executable
  ```sh
  chmod +x quickstart.sh
  ``` 

4. Specify REGION variable and create a new Docker repository named quickstart-docker-repo 
  ```sh
export REGION=
gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
    --location=$REGION --description="Docker repository"
  ```

5. Build the Docker container image in Cloud Build
  ```sh
  gcloud builds submit --tag $REGION-docker.pkg.dev/${DEVSHELL_PROJECT_ID}/quickstart-docker-repo/quickstart-image:tag1
  ``` 

<!-- Task3 -->
## Building containers with a YAML configuration file and Cloud Build

1. Create file called cloudbuild.yaml
  ```sh
    cat <<EOF > cloudbuild.yaml
    steps:
    - name: 'gcr.io/cloud-builders/docker'
      args: [ 'build', '-t', 'YourRegionHere-docker.pkg.dev/$PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1', '.' ]
    images:
    - 'YourRegionHere-docker.pkg.dev/$PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1'
    EOF
  ```

2. Insert the region you specified in variable earlier into the yaml file
 ```sh
  sed -i "s/YourRegionHere/$REGION/g" cloudbuild.yaml
 ```   

3. Verify the region was inserted
  ```sh
   cat cloudbuild.yaml
  ```

4. Start a Cloud Build using cloudbuild.yaml as the build configuration file
    ```sh
   gcloud builds submit --config cloudbuild.yaml
   ```

5. Verify two versions of quickstart-image are now present in quickstart-docker-repo
 ```sh
   gcloud artifacts docker images list $REGION-docker.pkg.dev/${DEVSHELL_PROJECT_ID}/quickstart-docker-repo
 ```
6. 





