gcloud compute firewall-rules create prometheus-default --allow tcp:9090
gcloud compute firewall-rules create puma-default --allow tcp:9292

docker-machine create --driver google \
--google-project week-3-262710 \
--google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
--google-machine-type n1-standard-1 \
--google-zone europe-west1-b \
vm1

eval $(docker-machine env vm1)

docker run --rm -p 9090:9090 -d --name prometheus prom/prometheus

docker-machine ip vm1

http://34.77.116.124:9090/

docker stop prometheus



export USER_NAME=belichenkoas
docker build -t $USER_NAME/prometheus .



/ui (microservices ✔) $ bash docker_build.sh
/post-py (microservices ✔) $ bash docker_build.sh
/comment (microservices ✔) $ bash docker_build.sh

add prometheus into docker-compose.yaml

docker-compose up -d

метрика ui_health

add node-exporter

docker build -t $USER_NAME/prometheus .

docker-compose down
docker-compose up -d

docker login

docker push $USER_NAME/ui
docker push $USER_NAME/comment
docker push $USER_NAME/post
docker push $USER_NAME/prometheus

docker-machine rm vm1