# Signal Sciences Kubernetes Sidecar Example

This example deployment method for Kubernetes is using NGINX with the Signal Sciences Native Module and a sidecar container with the Signal Sciences Agent. The configuration shown can be used for any other type of agent/module pair and gives a simple example of how to set things up.

The two containers communicate over a Unix Socket file shared via Shared Persistent Volume. In my example I will use minikube with a host folder within the minikube VM for the Persistent Volume.

## Setting up the Environment
**Note:** Directions for building the ingress container can be found at https://github.com/aaron-sigsci/sigsci-nginx-ingress-native

1. Download and install minikube from https://kubernetes.io/docs/tasks/tools/install-minikube/
2. Download and install kubectl from https://kubernetes.io/docs/tasks/tools/install-kubectl/
3. Run: `minikube start`
    - Note on Windows you will need to do something like `minikube start --vm-driver hyperv --hyperv-virtual-switch "Default Switch"` in order to work with Hyper-V
4. Run: `minikube addons enable dashboard`
5. Run: `minikube ssh`
    - In the VM run: `sudo mkdir /kube`
6. Run: `kubectl apply -f build_env.yaml` 
    - Please note you will need to update the following in the yaml:
        + The images (`image:trickyhu/sigsci-debian-nginx:latest`, `image:trickyhu/sigsci-agent-alpine:latest`) with your own unless you want to test with mine.
        + The value for `SIGSCI_NGINX_PORT` if you don't want to use the default `8282` if you change this you will also need to update `- containerPort: 8282`
        + The value for `SIGSCI_HOSTNAME` if you do not want to use the default
        + The value for `SIGSCI_SECRETACCESSKEY`
        + The value for `SIGSCI_ACCESSKEYID`
        + The `SIGSCI_ACCESSKEYID` will need to be updated for the Ingress, the Nginx Service, the Apache Service, and the Reverse Proxy Service
        + The POD Volume Mount to a Persistent Volume (PV) that exists in your kubernetes Cluster
        ````
       volumes:
         - name: sigsci-socket
           persistentVolumeClaim:
           claimName: microservice-b
        ````
7. Run: `kubectl expose deployment nginx-ingress-controller --type=NodePort`
8. Run: `kubectl expose deployment reverse-proxy --type=NodePort`
9. Run: `kubectl expose deployment microservice-a`
10. Run: `kubectl expose deployment microservice-b`
11. Run: `minikube service sigsci-nginx-example`
12. You can access the ingress controller easily by doing `minikube service ingress-nginx`
    - Apache service will be http://minikubeip:ingress_port/apache
    - NGIINX service will be http://minikubeip:ingress_port/nginx
    - RP Service will be http://minikubeip:rp_port

At this point you should now have a browser window pop up with a simple html page.