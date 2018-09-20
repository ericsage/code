FROM alpine

LABEL \
maintainer="Eric Sage <eric.david.sage@gmail.com>" \
repository="https://github.com/ericsage/orca"

# Setup the environment and variables for the Dockerfile.
ENV \
REPONAME=orca \
HOME=/root \
TERM=xterm \
GOPATH=/root/code \
LANG=C.UTF-8 \
LANGUAGE=C.UTF-8 \
LC_ALL=C.UTF-8 \
TZ=America/Los_Angeles

# Set the initial directory to where code should live.
WORKDIR $HOME/code/src/github.com/ericsage

# Copy the repository into the container.
COPY . $REPONAME

# Set the system package repositories.
# COPY $REPONAME/repositories /etc/apk/repositories

# Update and upgrade system packages.
RUN apk update -q && apk upgrade --latest -q

# Install system packages.
RUN apk add -q $(cat $REPONAME/packages/apk)

# Install python packages.
RUN pip3 install --upgrade -qqq -r $REPONAME/packages/pip

# Clone dotfiles into the container.
RUN git clone http://github.com/ericsage/dotfiles dotfiles

# Symlink the dotfiles into the home directory with stow.
RUN \
rm -f $HOME/.vimrc $HOME/.bashrc $HOME/.bash_profile && \
touch ~/.stow-global-ignore && \
stow --target $HOME dotfiles && \
rm ~/.stow-global-ignore

# Install vim plugins.
RUN vim +'silent PlugInstall' +qa  &> /dev/null

# Set tmux as the starting process.
CMD /usr/bin/tmux -2 new-session -s ${REPONAME}
