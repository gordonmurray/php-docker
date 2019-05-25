
# Learn to deploy a PHP script to a local Kubernetes cluster using Helm


## Install micro k8s

> sudo snap install microk8s --classic

## Install kubectl

> snap install kubectl --classic

## Install Helm

> snap install helm --classic

## Install Kubernetes addons

> microk8s.enable dashboard dns ingress storage

## Build the Docker image

> docker build . -t php-hello-world

## See the image

> docker images

## Run the image

> docker run --name=php-hello-world -it --rm -p 8090:80 php-hello-world

## See running images

> docker ps

## Docker login

> docker login --username=YOUR_DOCKERHUB_USERNAME

## Docker tag the image ( docker image to dockerhub username/tag)

> docker tag php-hello-world YOUR_DOCKERHUB_USERNAME/php-hello-world

## Push to docker

> docker push YOUR_DOCKERHUB_USERNAME/php-hello-world

## Create a helm chart

> helm create php-hello-world

## Update php-hello-world/values.yml

Update image repository to : YOUR_DOCKERHUB_USERNAME/php-hello-world

Update 'tag' to 'latest'

## Deploy app using helm

> helm install --name php-hello-world ./php-hello-world --set service.type=NodePort

## Delete the deployment from Kube

> helm delete --purge php-hello-world