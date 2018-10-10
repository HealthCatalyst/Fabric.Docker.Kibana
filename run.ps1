$dockername = "fabric.docker.kibana"

docker stop $dockername
docker rm $dockername

$ipForElasticSearch = docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' fabric.docker.elasticsearch
Write-Output "ip for elasticsearch: $ipForElasticSearch"
if([string]::IsNullOrWhiteSpace($ipForElasticSearch))
{
    exit 1
}

docker run --rm -p 5601:5601  --add-host elasticsearch:$ipForElasticSearch --name $dockername -t healthcatalyst/$dockername

