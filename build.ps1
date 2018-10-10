$dockername = "fabric.docker.kibana"

docker stop $dockername
docker rm $dockername

docker pull docker.elastic.co/kibana/kibana:6.4.2

docker build -t healthcatalyst/$dockername .
