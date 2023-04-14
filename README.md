
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

   Events:
   Type     Reason                     Age                 From                  Message
   ----     ------                     ----                ----                  -------
   Normal   SuccessfulStorageInstance  21m (x2 over 21m)   controller_mendixapp  reconcile StorageInstance create successful
   Normal   SuccessfulEndpoint         21m                 controller_mendixapp  reconcile Endpoint create successful
   Normal   SuccessfulBuild            21m                 controller_mendixapp  reconcile Build create successful
   Warning  TrialLicense               21m (x21 over 21m)  controller_mendixapp  app is running in trial mode
   default       ingress-nginx-nginx-ingress-controller-d4dd54c4-k8sms            1/1     Running   0          26m
   kube-system   event-exporter-gke-857959888b-w826m                              2/2     Running   0          29m
   kube-system   fluentbit-gke-562j7                                              2/2     Running   0          27m
   mendix        demo-master-b88bfd66f-bn5jl                                      2/2     Running   0          21m
   mendix        mendix-agent-9966b5f96-2bz5n                                     1/1     Running   0          21m
   mendix        mendix-operator-585f4f48b6-rzqrj                                 1/1     Running   0          21m
   Result: Count of pods running 
   ./validate.sh - Success: Number of running pods is        26

   Result: Checking Application Pods 
   ./validate.sh - Success: Number of running demo application pods is         1

   ./validate.sh   Application Url: demo.35.222.165.23.nip.io  #URL to access the Mendix app

