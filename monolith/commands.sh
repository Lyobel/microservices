docker-machine create --driver google \
--google-project week-3-262710 \
--google-zone europe-west1-b \
--google-machine-type f1-micro \
--google-machine-image $(gcloud compute images list --filter ubuntu-1604-lts --uri) \
docker-host

docker build -t reddit:latest .

docker images -a

docker run --name reddit -d --network=host reddit:latest

docker-machine ls

docker login

docker tag reddit:latest belichenkoas/example-reddit:1.0
docker push belichenkoas/example-reddit:1.0