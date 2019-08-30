FROM guygriffiths/ncwms:latest
MAINTAINER Kyle Wilcox <kyle@axiomdatascience.com>

COPY entrypoint.sh /ncWMS/entrypoint.sh

ARG WEB_CONTEXT=ROOT
RUN \
    [ "$WEB_CONTEXT" != "ncWMS" ] && \
    mv ${CATALINA_HOME}/conf/Catalina/localhost/ncWMS.xml ${CATALINA_HOME}/conf/Catalina/localhost/${WEB_CONTEXT}.xml && \
    mv ${CATALINA_HOME}/webapps/ncWMS ${CATALINA_HOME}/webapps/${WEB_CONTEXT} \
    || true
