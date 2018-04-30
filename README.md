orca
====
My containerized development environment 
 
- [Alpine Linux](https://hub.docker.com/_/alpine/) base
- [Vim plugins](https://github.com/ericsage/orca/blob/master/configfiles/.vimrc#L27-L74)
- [Alpine packages](https://github.com/ericsage/orca/blob/master/packages/apk)
- [Python packages](https://github.com/ericsage/orca/blob/master/packages/pip)
- [Go packages](https://github.com/ericsage/orca/blob/master/packages/go)

Usage
-----
```bash
docker run -it --name orca \
-v ~/Documents/Code:/root/Code/src \
-v ~/Documents/.secerets:/root/.secrets \
-v /var/run/docker.sock:/var/run/docker.sock \
--security-opt seccomp:unconfined \
-p 8080:8080 \
ericsage/orca:stable
```
