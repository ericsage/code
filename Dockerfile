FROM alpine
LABEL maintainer "Eric Sage <eric.david.sage@gmail.com>"

# Place config files
ADD /configfiles /root

# Switch to Edge repositories
ADD /repositories /etc/apk/repositories
RUN \
apk upgrade --update-cache --available $> /dev/null

# Install base packages
RUN \
apk add -q $(cat /root/.packages)

# Install global tools with pip
RUN \
pip3 install --upgrade -qqq pip setuptools && \
pip3 install -qqq virtualenv wheel twine awscli docker-compose

# Install global tools with npm
RUN \
npm install -g --silent create-react-app create-react-native-app

#Install GCloud SDK and Kubectl
RUN \
wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && \
unzip -q google-cloud-sdk.zip && rm google-cloud-sdk.zip && \
google-cloud-sdk/install.sh \
 --path-update=true \
 --bash-completion=true \
 --rc-path=/.bashrc \
 --additional-components app kubectl alpha beta &> /dev/null

# Install vim plugins
RUN \
vim -u NONE +'silent! source ~/.vimrc' +PlugInstall +qa! &> /dev/null && \
export GOPATH="/root/Code" && \
echo " " | vim +GoInstallBinaries +qa! &> /dev/null

# Set the initial directory
WORKDIR /root/Code/src/github.com/ericsage

# Set the language
ENV LANG en_US.UTF-8

# Set command to primary shell
CMD ["/usr/bin/tmux", "-2", "new-session", "-s", "main"]
