FROM alpine

LABEL \
maintainer="Eric Sage <eric.david.sage@gmail.com>" \
repository="https://github.com/ericsage/orca"

# Dockerfile variables
ENV \
REPONAME=orca \
HOME=/root \
TERM=xterm \
GOPATH=/root/code \
LANG=C.UTF-8 \
LANGUAGE=C.UTF-8 \
LC_ALL=C.UTF-8 \
TZ=America/Los_Angeles

# Set and update package repositories
# COPY /repositories /etc/apk/repositories
RUN apk update -q && apk upgrade --latest -q

# Install system packages
COPY /packages/apk $HOME/.packages/apk
RUN apk add -q $(cat $HOME/.packages/apk)

# Install python packages
COPY /packages/pip $HOME/.packages/pip
RUN pip3 install --upgrade -qqq -r $HOME/.packages/pip

# Install vim plugins
COPY /configfiles/.vimrc $HOME/.vimrc
RUN vim +'silent PlugInstall' +qa  &> /dev/null

# Set the initial directory
WORKDIR $HOME/code/src/github.com/ericsage

# Add and symlink user configuration files
COPY . $HOME/code/src/github.com/ericsage/$REPONAME
RUN \
rm -f $HOME/.vimrc $HOME/.bashrc $HOME/.bash_profile && \
touch ~/.stow-global-ignore && \
cd $PWD/$REPONAME && stow --target $HOME configfiles && \
rm ~/.stow-global-ignore

# Set tmux as the starting process
CMD /usr/bin/tmux -2 new-session -s ${REPONAME}
