# Example Docker Image Using Prometheus jmx_exporter

See [jmx_exporter](https://github.com/prometheus/jmx_exporter) for full usage.

This is an example build of a Docker image which runs Jetty and exposes JMX statistics for Prometheus over HTTP on port 9093 at /metrics

## Build Prometheus JMX Exporter JAR

Simple:

```
git clone git@github.com:prometheus/jmx_exporter.git
docker run -it --volume=`pwd`/jmx_exporter:/usr/src/app -w /usr/src/app maven mvn clean install
cp jmx_exporter/jmx_prometheus_javaagent/target/jmx_prometheus_javaagent-0.7-SNAPSHOT.jar .
```

## Build the Docker Image

Only the usual magic:

```
docker build .
```

## Running it

```
docker run -p 8080:8080 -p 9093:9093 <image ID>
```


