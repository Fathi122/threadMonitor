#!/bin/sh

java -javaagent:/opt/threadMonitor/jmx_prometheus_javaagent-0.16.1.jar=8083:/opt/threadMonitor/config.yml -jar /opt/threadMonitor/threadMonitor.jar

