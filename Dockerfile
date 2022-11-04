# Official jenkins image
FROM jenkins/jenkins:lts
# Swith to root to be able to install Docker and modify permissions
USER root
# docker group ID must match id in host system, ex. sudo grep docker /etc/group
ARG DOCKER_GID=998

# Install docker
RUN groupadd -g ${DOCKER_GID} docker \
  && curl -sSL https://get.docker.com/ | sh \
  && apt-get -q autoremove \
  && apt-get -q clean -y \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin 

# Add jenkins user to docker group
RUN usermod -aG docker jenkins

# Switch back to default user
USER jenkins

# Bild the image:
# sudo docker build -t yourusername/imagename .
# Run the image and mount with the followin bind mount option:
# sudo docker run --name imagename -d -p8080:8080 -v /var/run/docker.sock:/var/run/docker.sock yourusername/imagename