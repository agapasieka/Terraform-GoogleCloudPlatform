# Three-tier architecture

![img](modules-diagram.png)

Deploy a three-tier architecture consisting of a Load Balancer, a managed instance group (MIG) and Storage Bucket using Terraform public modules with input variables for custom builds. 

Once you have successfully deployed all resources, you will be presented with Load Balancer's IP in the output section. 
Paste the IP into your browser to see the website. 
The startup script installs apache web server with php module and queries our backend's host information
