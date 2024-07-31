<!-- Overview -->
## Overview
In this lab, you learn how to perform the following tasks:

* Create deployment manifests, deploy to cluster, and verify Pod rescheduling as nodes are disabled.
* Trigger manual scaling up and down of Pods in deployments.
* Trigger deployment rollout (rolling update to new version) and rollbacks.
* Perform a Canary deployment.


<!-- Task1 -->
## Set the environment variable for the zone and cluster name
  ```sh
export REGION=
export CLUSTER=
  ```

<!-- Task2 -->
## Create a Kubernetes cluster

  ```sh
  gcloud container clusters create $CLUSTER --num-nodes 3 --region $REGION --enable-ip-alias
  ```  

<!-- Task3 -->
## Configure access to your cluster
  ```sh
  gcloud container clusters get-credentials $CLUSTER --region $REGION
  ```

<!-- Task4 -->
## Create a sample deployment manifest called nginx-deployment.yaml
This deployment is configured to run three Pod replicas with a single nginx container in each Pod listening on TCP port 80.
  ```sh
  cat << EOF > nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
EOF
  ``` 

<!-- Task5 -->
## Deploy the manifest
  ```sh
kubectl apply -f ./nginx-deployment.yaml
  ```

<!-- Task6 -->
## View a list of deployments
  ```sh
  kubectl get deployments
  ``` 

<!-- Task7 -->
## Scale udown the number of Pods in deployments
  ```sh
kubectl scale --replicas=1 deployment nginx-deployment
  ```

<!-- Task8 -->
## Trigger a deployment rollout and a deployment rollback
 ```sh
  
 ```   

3. 
  ```sh
   
  ```

4. 
  ```sh
   
  ```

5. 
 ```sh
   
 ```

<!-- Task3 -->
## 
1. 
 ```sh
 
  ``` 

2. 
 ```sh

  ```

3.  
  ```sh
   
  ```

4. 
  ```sh
  
  ```



## The End
