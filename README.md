
PORT
====
My development environment inside of a Docker container
 
Anatomy
-------
- [Alpine Linux](https://hub.docker.com/_/alpine/) base
- [Vim plugins](https://github.com/ericsage/code/blob/master/configfiles/.vimrc#L27-L74)
- [Alpine packages](https://github.com/ericsage/code/blob/master/packages/apk)
- [Python packages](https://github.com/ericsage/code/blob/master/packages/pip)
- [Go packages](https://github.com/ericsage/code/blob/master/packages/go)

Usage
-----
```bash
docker run -it --name port \
-v ~/Documents/code:/root/code/src \
-v ~/Documents/.secerets:/root/.secrets \
-v /var/run/docker.sock:/var/run/docker.sock \
--security-opt seccomp:unconfined \
ericsage/port
```
