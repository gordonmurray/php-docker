 #!/usr/bin/env bash

TAG="0.5"
YOUR_DOCKERHUB_USERNAME=xxxxx
DATABASE_USER=`echo "testing" | base64`

docker login --username=$YOUR_DOCKERHUB_USERNAME --password="xxxxx" 

docker build . -t php-hello-world

docker tag php-hello-world $YOUR_DOCKERHUB_USERNAME/php-hello-world:$TAG

docker push $YOUR_DOCKERHUB_USERNAME/php-hello-world:$TAG

helm upgrade php-hello-world --install --wait ./php-hello-world --set service.type=NodePort --namespace default --set image.tag="$TAG" --set database_user="$DATABASE_USER"

export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services php-hello-world)
export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
