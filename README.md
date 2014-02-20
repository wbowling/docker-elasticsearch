# docker-elasticsearch

    ES_CLUSTER_NAME=
    ES_PUBLISH_HOST=
    AWS_ACCESS_KEY=
    AWS_SECRET_KEY=
    AWS_REGION=

    docker pull andrewvos/docker-elasticsearch
    docker run -i -t -p 9200:9200 -p 9300:9300 -e ES_CLUSTER_NAME=$ES_CLUSTER_NAME -e ES_PUBLISH_HOST=$ES_PUBLISH_HOST -e AWS_ACCESS_KEY=$AWS_ACCESS_KEY -e AWS_SECRET_KEY=$AWS_SECRET_KEY -e AWS_REGION=$AWS_REGION andrewvos/docker-elasticsearch
