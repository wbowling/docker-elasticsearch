FROM ubuntu

#elasticsearch
RUN apt-get update && \
    apt-get install -y --force-yes curl && \
    apt-get install -y --force-yes openjdk-7-jre-headless && \
    curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.0.deb && \
    dpkg -i elasticsearch-1.0.0.deb

#elasticsearch plugins
RUN /usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
RUN /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.0.0.RC1

ADD launch-elasticsearch /launch-elasticsearch

WORKDIR /etc/elasticsearch
CMD ["/launch-elasticsearch"]
