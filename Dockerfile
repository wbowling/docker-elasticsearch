FROM stackbrew/ubuntu

#elasticsearch
RUN apt-get update && \
    apt-get install -y --force-yes curl && \
    apt-get install -y --force-yes openjdk-7-jre-headless && \
    curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb && \
    dpkg -i elasticsearch-1.2.1.deb

#elasticsearch plugins
RUN /usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
RUN /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic
RUN /usr/share/elasticsearch/bin/plugin -install polyfractal/elasticsearch-segmentspy
RUN /usr/share/elasticsearch/bin/plugin -url https://github.com/grmblfrz/elasticsearch-zookeeper/releases/download/v1.2.0/elasticsearch-zookeeper-1.2.0.zip -install zookeeper
ADD launch-elasticsearch /launch-elasticsearch

WORKDIR /etc/elasticsearch
CMD ["/launch-elasticsearch"]
