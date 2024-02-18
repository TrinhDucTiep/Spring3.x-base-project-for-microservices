#FROM --platform=$BUILDPLATFORM gradle:7.6.3-jdk17 AS build
#WORKDIR /workspace
#
#COPY --chown=gradle:gradle . .
#RUN gradle build --no-daemon -x test
#
#
#FROM --platform=$TARGETPLATFORM eclipse-temurin:17-jre
#WORKDIR /workspace
#COPY --from=build /workspace/api/build/libs/*.jar ./api.jar
#COPY --from=build /workspace/consumer/build/libs/*.jar ./consumer.jar
#COPY  --from=build /workspace/migration/build/libs/*.jar ./migration.jar
#COPY --from=build /workspace/scheduler/build/libs/*.jar ./scheduler.jar


# Build Stage
FROM gradle:7.6.3-jdk17 AS build
WORKDIR /workspace
COPY --chown=gradle:gradle . .
RUN gradle clean build --no-daemon -x test

# Final Stage
FROM eclipse-temurin:17-jre
WORKDIR /workspace
COPY --from=build /workspace/api/build/libs/*.jar ./api.jar
COPY --from=build /workspace/consumer/build/libs/*.jar ./consumer.jar
