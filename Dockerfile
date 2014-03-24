FROM stackbrew/ubuntu

#elasticsearch
RUN apt-get update && \
    apt-get install -y --force-yes curl && \
    apt-get install -y --force-yes openjdk-7-jre-headless && \
    curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.1.deb && \
    dpkg -i elasticsearch-0.90.1.deb

#elasticsearch plugins
RUN /usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ
RUN /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
RUN /usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/1.16.0
RUN /usr/share/elasticsearch/bin/plugin -install karmi/elasticsearch-paramedic
RUN /usr/share/elasticsearch/bin/plugin -install polyfractal/elasticsearch-segmentspy
RUN /usr/share/elasticsearch/bin/plugin -url https://oss-es-plugins.s3.amazonaws.com/elasticsearch-zookeeper/elasticsearch-zookeeper-0.90.0.zip -install elasticsearch-zookeeper-0.90.0

ADD launch-elasticsearch /launch-elasticsearch

WORKDIR /etc/elasticsearch
CMD ["/launch-elasticsearch"]
