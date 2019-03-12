FROM jenkins/jenkins:lts
# if we want to install via apt
USER root
RUN echo "root:jenkins!" | chpasswd
# from https://docs.docker.com/install/linux/docker-ce/debian/
# remove old stuff, update 
RUN apt-get remove docker docker-engine docker.io containerd runc || echo keep going
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
# setup up debian repo
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# install docker-ce
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
# setup to run

# drop back to the regular jenkins user - good practice
USER jenkins
