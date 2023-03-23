# Perform rolling update on Managed Instance Group 

In order to force a rolling update with terraform, we need to use "name_prefix" attribute in Compute Intance Template and "substr" function in MIG's name. When we chanage the template in MIG's config, MIG is recreated, and therefore, the instances are recreated as well.
Read about substr function here: https://developer.hashicorp.com/terraform/language/functions/substr. 

We will create 2 templates (blue and green), deploy our mig with blue one and perform rolling update using green template. 
The differences in templates are machine types and also, the green template does not assign external IP to vms but instead uses Cloud NAT for outbound connectivity. Other resources like Load Balancer are deployed for testing results. 

Web servers are installed by startup scripts attached to Compute Intance Templates.

1. Run Terraform apply to deploy resources specifying company name and project id
```
terraform apply
```
2. Browse to load balancer's IP to view deployed website. The sample website should display: Apache Web Server: blue deployment
3. Go to mig.tf and replace blue template with green in both places: mig's name and version and save your changes 
4. Run terraform apply again
```
terraform apply
```
5. Browse to load balancer's IP. The sample website should now display: Apache Web Server: green deployment. You can also check in console if instances were deployed with new machine type and without external IP.  
