<!-- Overview -->
## Overview
In this lab, you learn how to perform the following tasks:

* Define, deploy and clean up a GKE Job
* Define, deploy and clean up a GKE CronJob

Perform steps in cloud shell or terminal of your choice. 

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
## Create file called example-job.yaml that contains a sample Job that computes the value of Pi to 2,000 places and then prints the result
  ```sh
cat << EOF > example-job.yaml
apiVersion: batch/v1
kind: Job
metadata:
  # Unique key of the Job instance
  name: example-job
spec:
  template:
    metadata:
      name: example-job
    spec:
      containers:
      - name: pi
        image: perl:5.34
        command: ["perl"]
        args: ["-Mbignum=bpi", "-wle", "print bpi(2000)"]
      # Do not restart containers after they exit
      restartPolicy: Never
EOF
  
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
