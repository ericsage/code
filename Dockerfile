FROM alpine
LABEL maintainer "Eric Sage <eric.david.sage@gmail.com>"

# Place config files
ADD /configfiles /root

# Install base packages
RUN \
apk add -y $(cat /root/.packages) && \
apk cache clean

# Install global tools with pip
RUN \
pip3 install --upgrade pip setuptools && \
pip3 install virtualenv wheel twine awscli docker-compose

# Install global tools with npm
RUN npm install -g create-react-app create-react-native-app

#Install GCloud SDK and Kubectl
RUN \
wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && \
unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip && \
google-cloud-sdk/install.sh \
 --path-update=true \
 --bash-completion=true \
 --rc-path=/.bashrc \
 --additional-components app kubectl alpha beta

# Install vim plugins
RUN \
vim -u NONE +'silent! source ~/.vimrc' +PlugInstall +qa! %> /dev/null && \
export GOROOT="/usr/bin/go" ; export GOPATH="/root/Code" ; export PATH=$PATH:/usr/bin/go/bin ; \
echo " " | vim +GoInstallBinaries +qa! %> /dev/null

# Set the initial directory
WORKDIR /root/Code/src/github.com/ericsage

# Set the language
ENV LANG en_US.UTF-8

# Set command to primary shell
CMD ["/bin/tmux", "-2"]
