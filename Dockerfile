FROM	jetty

# CMD mkdir /data
ADD jmx_prometheus_javaagent-0.7-SNAPSHOT.jar /data/jmx_prometheus_javaagent-0.7-SNAPSHOT.jar
ADD prometheus-jmx-config.yaml /data/prometheus-jmx-config.yaml

RUN	java	-jar	$JETTY_HOME/start.jar	--add-to-startd=http2	--approve-all-licenses
CMD	java	-javaagent:/data/jmx_prometheus_javaagent-0.7-SNAPSHOT.jar=9093:/data/prometheus-jmx-config.yaml	-jar $JETTY_HOME/start.jar

