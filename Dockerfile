FROM adoptopenjdk/openjdk11-openj9:jdk-11.0.1.13-alpine-slim as builder
WORKDIR /micronaut/src/gcrdemo
COPY . .
RUN ./gradlew assemble
FROM adoptopenjdk/openjdk11-openj9:jdk-11.0.1.13-alpine-slim
COPY --from=builder /micronaut/src/gcrdemo/build/libs/gcrdemo-*-all.jar gcrdemo.jar
EXPOSE 8080
CMD java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -Dcom.sun.management.jmxremote -noverify ${JAVA_OPTS} -jar gcrdemo.jar
