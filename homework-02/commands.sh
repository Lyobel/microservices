docker pull mongo:latest

docker build -t belichenkoas/post:1.0 ./post-py
docker build -t belichenkoas/comment:1.0 ./comment
docker build -t belichenkoas/ui:1.0 ./ui

docker network create reddit

docker run -d --network=reddit \
--network-alias=post_db --network-alias=comment_db mongo:latest

docker run -d --network=reddit \
--network-alias=post belichenkoas/post:1.0

docker run -d --network=reddit \
--network-alias=comment belichenkoas/comment:1.0

docker run -d --network=reddit \
-p 9292:9292 belichenkoas/ui:1.0


docker kill $(docker ps -q)

docker build -t belichenkoas/ui:2.0 ./ui


docker run -d --network=reddit \
--network-alias=post_db --network-alias=comment_db mongo:latest

docker run -d --network=reddit \
--network-alias=post belichenkoas/post:1.0

docker run -d --network=reddit \
--network-alias=comment belichenkoas/comment:1.0

docker run -d --network=reddit \
-p 9292:9292 belichenkoas/ui:2.0


docker volume create reddit_db
docker kill $(docker ps -q)


docker run -d --network=reddit -v reddit_db:/data/db \
--network-alias=post_db --network-alias=comment_db mongo:latest

docker run -d --network=reddit \
--network-alias=post belichenkoas/post:1.0

docker run -d --network=reddit \
--network-alias=comment belichenkoas/comment:1.0

docker run -d --network=reddit \
-p 9292:9292 belichenkoas/ui:2.0