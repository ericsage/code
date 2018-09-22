FROM alpine

LABEL \
maintainer="Eric Sage <eric.david.sage@gmail.com>" \
repository="https://github.com/ericsage/orca"

# Setup the environment and variables for the Dockerfile.
ENV \
REPONAME=home \
HOMEDIR=/root \
TERM=xterm \
GOPATH=/root/code \
LANG=C.UTF-8 \
LANGUAGE=C.UTF-8 \
LC_ALL=C.UTF-8 \
TZ=America/Los_Angeles

# Set the initial directory to where code should live.
WORKDIR $HOMEDIR/code/src/github.com/ericsage

# Copy the repository into the container.
COPY . $REPONAME

# Update and upgrade system packages.
RUN apk update -q && apk upgrade --latest -q

# Install system packages.
RUN apk add -q $(cat $REPONAME/packages/apk)

# Install python packages.
RUN pip3 install --upgrade -qqq -r $REPONAME/packages/pip

# Clone dotfiles into the container.
RUN git clone https://github.com/ericsage/dotfiles dotfiles

# Symlink the dotfiles into the home directory with stow.
RUN \
rm -f $HOMEDIR/.vimrc $HOMEDIR/.bashrc $HOMEDIR/.bash_profile && \
touch ~/.stow-global-ignore && \
stow --target $HOMEDIR dotfiles && \
rm ~/.stow-global-ignore

# Install vim plugins.
RUN vim +'silent PlugInstall' +qa  &> /dev/null

# Set tmux as the starting process.
CMD /usr/bin/tmux -2 new-session -s ${REPONAME}
