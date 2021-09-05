FROM openjdk:18-jdk-alpine

RUN mkdir -p /opt/threadMonitor

COPY ./src/threadMonitor/* /opt/threadMonitor/
COPY ./jmx_prometheus_javagent/jmx_prometheus_javaagent-0.14.1-SNAPSHOT.jar /opt/threadMonitor/
COPY ./starmonitor.sh /opt/threadMonitor/
COPY ./config.yml /opt/threadMonitor/


WORKDIR /opt/threadMonitor

RUN javac -d . *.java && \
    jar cvfe threadMonitor.jar threadMonitor.ThreadMain threadMonitor/*.class && \
    rm -f *.java && \
    chmod +x /opt/threadMonitor/starmonitor.sh
