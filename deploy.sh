 #!/usr/bin/env bash

TAG="0.05"
YOUR_DOCKERHUB_USERNAME=XXXXX

docker login --username=$YOUR_DOCKERHUB_USERNAME --password="XXXXX" 

docker build . -t php-hello-world

docker tag php-hello-world $YOUR_DOCKERHUB_USERNAME/php-hello-world:$TAG

docker push $YOUR_DOCKERHUB_USERNAME/php-hello-world:$TAG

helm upgrade php-hello-world --install --wait ./php-hello-world --set service.type=NodePort --namespace default --set image.tag="$TAG" --set database_user="fred"

export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services php-hello-world)
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
