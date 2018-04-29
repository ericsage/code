FROM alpine:latest

LABEL \
maintainer="Eric Sage <eric.david.sage@gmail.com>" \ 
repository="https://github.com/ericsage/orca"

# Dockerfile variables
ENV \
REPONAME=orca \
HOME=/root \
GOPATH=/root/Code \
LANG=en_US.UTF-8 \
TZ=America/Los_Angeles

# Set and update package repositories
COPY /repositories /etc/apk/repositories
RUN apk update -q && apk upgrade --latest -q

# Install system packages
COPY /packages/apk $HOME/.packages/apk
RUN apk add -q $(cat $HOME/.packages/apk)

# Install python packages
COPY /packages/pip $HOME/.packages/pip
RUN pip3 install --upgrade -qqq -r $HOME/.packages/pip

# Install go packages
COPY /packages/go $HOME/.packages/go
RUN go get $(cat $HOME/.packages/go) && \
$GOPATH/bin/gometalinter --install &> /dev/null

# Install vim plugins
COPY /configfiles/.vimrc $HOME/.vimrc
RUN \
vim -u NONE +'silent! source ~/.vimrc' +PlugInstall +qa! &> /dev/null

# Set the initial directory
WORKDIR $HOME/Code/src/github.com/ericsage

# Add and symlink user configuration files
COPY . $HOME/Code/src/github.com/ericsage/$REPONAME
RUN \
rm -f $HOME/.vimrc $HOME/.bashrc $HOME/.bash_profile && \ 
touch ~/.stow-global-ignore && \
cd $PWD/$REPONAME && stow --target $HOME configfiles && \
rm ~/.stow-global-ignore

# Set tmux as the starting process
CMD /usr/bin/tmux -2 new-session -s ${REPONAME}
