# Стадия 1: Сборка (build)
FROM openjdk:8-jdk-alpine AS builder

WORKDIR /project/src
COPY . . 

RUN ./mvnw -B dependency:go-offline && \
./mvnw -B package -DskipTests

# Стадия 2: Запуск (runtime)
FROM openjdk:8-jdk-alpine

WORKDIR /project/
COPY --from=builder /project/src/target/*.jar ./booking.jar





EXPOSE 8083
COPY ./wait-for-it.sh .
RUN apk update && apk add bash && chmod +x /project/wait-for-it.sh
ENTRYPOINT ["bash", "-c",\
  "./wait-for-it.sh -s -t 60 postgres:5432 -- \
 ./wait-for-it.sh -s -t 60 rabbitmq:5672 -- \
 sleep 5 && java -jar *.jar"]
