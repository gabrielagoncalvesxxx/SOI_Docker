FROM openjdk:21-jdk
RUN mkdir -p /usr/src/appjava /usr/src/projjava
RUN chmod -R 777 /usr/src
COPY Eu.java /usr/src/appjava/
RUN javac -d /usr/src/appjava /usr/src/appjava/Eu.java
WORKDIR /usr/src/projjava
CMD ["java", "-cp", "/usr/src/appjava", "Eu"]
