<!-- Overview -->
## Overview

In this lab, you set up an application in Google Kubernetes Engine (GKE), and then use a HorizontalPodAutoscaler to autoscale the web application. You then work with multiple node pools of different types, and you apply taints and tolerations to control the scheduling of Pods with respect to the underlying node pool.




<!-- Task1 -->
## Set the environment variable for the zone and cluster name
  ```sh
export ZONE=
export CLUSTER=
  ```

<!-- Task2 -->
## Create a Kubernetes cluster
  ```sh
gcloud container clusters create $CLUSTER --num-nodes 3 --zone $ZONE --enable-ip-alias
  ```  

<!-- Task3 -->
## Configure access to your cluster
  ```sh
gcloud container clusters get-credentials $CLUSTER --zone $ZONE
  ```

<!-- Task4 -->
## Deploy a sample web application to your GKE cluster
  ```sh
kubectl create -f web.yaml --save-config
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
