FROM maven:3.6.3-jdk-11 as build

# Copy artifacts into build directory
RUN mkdir /build
WORKDIR /build
COPY . .

# Run build
RUN mvn clean install

# Create container
FROM amazoncorretto:11

RUN mkdir /app
COPY --from=build /build/target/portfolio.jar /app/portfolio.jar
RUN chmod -R 777 /app

ENTRYPOINT ["java","-jar","/app/portfolio.jar"]