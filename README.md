# docker-elasticsearch

An elasticsearch container that works on EC2 with coreos.

    # Optional, defaults to elasticsearch.
    ES_CLUSTER_NAME=
    # The host to publish elasticsearch on.
    ES_PUBLISH_HOST=(optional)
    # Number of index replicas.
    ES_NUMBER_OF_REPLICAS=(optional)
    # These two variables should be set if you want to use EC2 discovery.
    AWS_ACCESS_KEY=(optional)
    AWS_SECRET_KEY=(optional)
    # This is optional, but only works if the above to variables are set.
    AWS_REGION=(optional)

    docker pull andrewvos/docker-elasticsearch
    docker run -i -t -p 9200:9200 -p 9300:9300 -e ES_CLUSTER_NAME=$ES_CLUSTER_NAME -e ES_PUBLISH_HOST=$ES_PUBLISH_HOST -e AWS_ACCESS_KEY=$AWS_ACCESS_KEY -e AWS_SECRET_KEY=$AWS_SECRET_KEY -e AWS_REGION=$AWS_REGION andrewvos/docker-elasticsearch
