FROM ubuntu:23.10
LABEL maintainer="mp30028" \
      email="mp30028@gmail.com" \
      description="Dockerfile with mysql-client"
RUN apt update
RUN apt -y upgrade
RUN apt -y install nano
RUN apt install -y mysql-client

#ENTRYPOINT ["/bin/bash"]