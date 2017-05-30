FROM docker.elastic.co/kibana/kibana:5.4.0

ENV KIBANA_HOME /usr/share/kibana

# MKDIR 
# update config
ADD ./kibana.yml ${KIBANA_HOME}/config/kibana.yml
ADD ./kibanassl.yml ${KIBANA_HOME}/config/kibanassl.yml
ADD ./kibanasecure.yml ${KIBANA_HOME}/config/kibanasecure.yml

### install plugins
# RUN gosu kibana ${KIBANA_HOME}/bin/kibana-plugin install x-pack

ADD ./ca.crt /usr/local/share/ca-certificates

USER root
RUN /usr/sbin/update-ca-certificates

USER kibana
