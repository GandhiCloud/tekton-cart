FROM maven:3.5.3-jdk-8-alpine
# FROM maven:3.5.4-jdk-10-slim
WORKDIR /usr/src/java-code
COPY ./app /usr/src/java-code/
RUN mvn package
 
WORKDIR /usr/src/java-app
RUN cp /usr/src/java-code/target/*.jar ./app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

# FROM anapsix/alpine-java:8
# WORKDIR /
# ADD target/tekton-cart-0.0.1-SNAPSHOT.jar tekton-cart.jar
# RUN sh -c 'touch /tekton-cart.jar'
# EXPOSE 80
# ENTRYPOINT ["java","-jar","/tekton-cart.jar"]

# #### Stage 1: Build the application
# FROM openjdk:8-jdk-alpine as build

# # Set the current working directory inside the image
# WORKDIR /app

# # Copy maven executable to the image
# COPY mvnw .
# COPY .mvn .mvn

# # Copy the pom.xml file
# COPY pom.xml .

# # Build all the dependencies in preparation to go offline. 
# # This is a separate step so the dependencies will be cached unless 
# # the pom.xml file has changed.
# RUN ./mvnw dependency:go-offline -B

# # Copy the project source
# COPY src src

# # Package the application
# RUN ./mvnw package -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# #### Stage 2: A minimal docker image with command to run the app 
# FROM openjdk:8-jre-alpine

# ARG DEPENDENCY=/app/target/dependency

# # Copy project dependencies from the build stage
# COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app

# ENTRYPOINT ["java","-cp","app:app/lib/*","com.gan.tektoncart.TektonCartApplication"]