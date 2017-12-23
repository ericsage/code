FROM alpine:latest

LABEL maintainer "Eric Sage <eric.david.sage@gmail.com>"

# Set and update package repositories
COPY /repositories /etc/apk/repositories
RUN apk upgrade --latest -q

# Install system packages
COPY /packages/apk /root/.packages/apk
RUN apk update -q && apk add -q $(cat /root/.packages/apk)

# Install python packages
COPY /packages/pip /root/.packages/pip
RUN pip3 install --upgrade -qqq -r /root/.packages/pip

# Install go packages
COPY /packages/go /root/.packages/go
RUN export GOPATH=/root/code && go get $(cat /root/.packages/go)

# Install gcloud SDK and kubectl
RUN \
wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && \
unzip -q google-cloud-sdk.zip -d /usr/lib && rm google-cloud-sdk.zip && \
/usr/lib/google-cloud-sdk/install.sh \
 --quiet \
 --path-update=true \
 --bash-completion=true \
 --additional-components kubectl alpha beta &> /dev/null

# Install vim plugins
ADD /configfiles/.vimrc /root/.vimrc
RUN vim -u NONE +'silent! source ~/.vimrc' +PlugInstall +qa! &> /dev/null

# Add user configuration files
ADD /configfiles /root

# Set the initial directory
WORKDIR /root/code/src/github.com/ericsage

# Set the language
ENV LANG en_US.UTF-8

# Set starting process to tmux
CMD [ "/usr/bin/tmux", "-2", "new-session", "-s", "main" ]
