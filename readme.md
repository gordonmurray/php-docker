


## build the image

> docker build . -t php-hello-world

## See the image

> docker images

## run the image

> docker run --name=php-hello-world -it --rm -p 8090:80 php-hello-world

## See running images

> docker ps

## docker login

> docker login --username=YOUR_DOCKERHUB_USERNAME

## docker tag the image ( docker image to docker username/tag)

> docker tag php-hello-world YOUR_DOCKERHUB_USERNAME/php-hello-world

## Push to docker

> docker push YOUR_DOCKERHUB_USERNAME/php-hello-world

## create helm chart

> helm create php-hello-world

## update php/values.yml

Update image repository to : YOUR_DOCKERHUB_USERNAME/php-hello-world

Update 'tag' to 'latest'

## deploy app using helm

> helm install --name php-hello-world ./php-hello-world --set service.type=NodePort

## Delete the deployment from Kube

> helm delete --purge php-hello-world