
# GKE Mendix Quickstart


   Create a GKE Cluster

   Deploy nginx Ingress Controller

   Deploy a sample Mendix application

## PreRequisites
   glcoud is set up to access gcp.
   Terraform is installed

## To Execute

   terraform init
   terraform plan
   terraform apply --auto-approve

## Results

    It will show if the result was Successful or not.
   
    sharath.sahadevan@C02CR0U0MD6W gke-mendix-quickstart % kubectl get pods -n mendix
    NAMESPACE     NAME                                                             READY   STATUS    RESTARTS   AGE
    mendix        demo-master-5d45cfc998-svvjt                                     2/2     Running   0          108m
    mendix        mendix-agent-9966b5f96-g4pdf                                     1/1     Running   0          3h3m
    mendix        mendix-operator-585f4f48b6-6bqhl                                 1/1     Running   0          3h3m
