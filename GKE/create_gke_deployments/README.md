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

## Create a sample deployment manifest called nginx-deployment.yaml. 
## This deployment is configured to run three Pod replicas with a single nginx container in each Pod listening on TCP port 80.
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
