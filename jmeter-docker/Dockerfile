FROM ubuntu
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre

COPY jmeter /jmeter

ENTRYPOINT /jmeter/bin/jmeter -n -t /jmeter/bin/mongo.jmx
