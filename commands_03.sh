#None network driver
docker run --network none --rm -d --name net_test joffotron/docker-net-tools -c "sleep 100"
docker exec -ti net_test ifconfig

#Host network driver
docker run --network host --rm -d --name net_test joffotron/docker-net-tools -c "sleep 100"
docker exec -ti net_test ifconfig
docker-machine ssh docker-host ifconfig

docker run --network host -d nginx
docker run --network host -d nginx
docker run --network host -d nginx

#Docker networks
sudo ln -s /var/run/docker/netns /var/run/netns

sudo ip netns

#Bridge network driver
docker network create reddit --driver bridge


docker network create back_net --subnet=10.0.2.0/24
docker network create front_net --subnet=10.0.1.0/24

docker run -d --network=front_net -p 9292:9292 --name ui belichenkoas/ui:2.0
docker run -d --network=back_net --name comment belichenkoas/comment:1.0
docker run -d --network=back_net --name post belichenkoas/post:1.0
docker run -d --network=back_net --name mongo_db --network-alias=post_db --network-alias=comment_db mongo:latest

docker network connect front_net post
docker network connect front_net comment


docker-machine ssh docker-host
sudo apt-get update && sudo apt-get install bridge-utils

docker network ls

ifconfig | grep br

brctl show <interface>

sudo iptables -nL -t nat 

ps ax | grep docker-proxy

export USERNAME=belichenkoas
docker-compose up -d
docker-compose ps
