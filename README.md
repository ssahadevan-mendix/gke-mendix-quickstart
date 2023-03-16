
GKE Mendix Quickstart


Create a GKE Cluster

Deploy nginx

Deploy a sample Mendix application


% kubectl get pods --all-namespaces
NAMESPACE     NAME                                                             READY   STATUS    RESTARTS   AGE
default       nginx-example                                                    1/1     Running   0          84m
kube-system   event-exporter-gke-857959888b-zz55p                              2/2     Running   0          87m
kube-system   fluentbit-gke-48d8z                                              2/2     Running   0          83m
kube-system   fluentbit-gke-j8cnv                                              2/2     Running   0          83m
kube-system   fluentbit-gke-tjvmb                                              2/2     Running   0          83m
kube-system   gke-metrics-agent-47tt8                                          1/1     Running   0          83m
kube-system   gke-metrics-agent-bvr5f                                          1/1     Running   0          83m
kube-system   gke-metrics-agent-sm775                                          1/1     Running   0          83m
kube-system   konnectivity-agent-6b6596dc66-77sj5                              1/1     Running   0          87m
kube-system   konnectivity-agent-6b6596dc66-kvpsg                              1/1     Running   0          87m
kube-system   konnectivity-agent-6b6596dc66-t82qb                              1/1     Running   0          87m
kube-system   konnectivity-agent-autoscaler-bd45744cc-vlnvv                    1/1     Running   0          87m
kube-system   kube-dns-7d5998784c-cq8tj                                        4/4     Running   0          87m
kube-system   kube-dns-7d5998784c-czp68                                        4/4     Running   0          87m
kube-system   kube-dns-autoscaler-9f89698b6-7pqx8                              1/1     Running   0          87m
kube-system   kube-proxy-gke-ss-test-demo-gke-ss-test-demo-gke-4f21eb95-36f7   1/1     Running   0          83m
kube-system   kube-proxy-gke-ss-test-demo-gke-ss-test-demo-gke-eae3efe3-wds1   1/1     Running   0          83m
kube-system   kube-proxy-gke-ss-test-demo-gke-ss-test-demo-gke-f7e5cc28-cpmq   1/1     Running   0          83m
kube-system   l7-default-backend-6dc845c45d-4cvbf                              1/1     Running   0          87m
kube-system   metrics-server-v0.5.2-6bf845b67f-rv4st                           2/2     Running   0          87m
kube-system   pdcsi-node-8krhd                                                 2/2     Running   0          83m
kube-system   pdcsi-node-lssl6                                                 2/2     Running   0          83m
kube-system   pdcsi-node-rjk79                                                 2/2     Running   0          83m

