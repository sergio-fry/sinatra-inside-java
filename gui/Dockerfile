FROM frekele/gradle:2.4-jdk8

RUN mkdir /app
COPY . /app/
WORKDIR /app

RUN gradle build

RUN ls build/libs
