# Docker Cheat Sheet
All of these assume you're running as root.  If not, preface them with `sudo` as needed.

### List of Dangling Images
```
docker images --filter 'dangling=true' 
```
To remove them:
```
docker images -q --filter 'dangling=true' | xargs docker rmi
```
It looks like Docker desktop has plugins to do this sort of thing, too.

### List of Containers that Exited
```
docker ps -a -f status=exited
```
To remove them:
```
docker ps -a -q -f status=exited | xargs docker rm
```
Cleaning up the dangling images might be useful - see above.
