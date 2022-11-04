#!/bin/bash

$jenkins_data_folder=/Users/Tomas.Pospisil/src/jenkins_data

docker build --tag jenkins-in-docker .

docker run --name jenkins-with-docker -d -p 8080:8080 -p 50000:50000 -v ${jenkins_data_folder}:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins-in-docker