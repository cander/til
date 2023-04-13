# Time Machine vs. Virtual Machine Images

I've always been kinda paranoid about the disk space used by VM images,
especially when it comes to backups. The last thing I want to do is be
backing up a whole VM image every time I fire up a VM like Docker or or MultiPass.

In the past, I put Vagrant images under a directory called `~/NoBackups`,
and I excluded it from Time Machine.  (At the moment, I don't have any Vagrant boxes.)

Some Googling says that Docker Desktop is storing images in
`~/Library/Containers/com.docker.docker`. I was able to exclude that
directory using the Time Machine UI.

More Googling says the MultiPass stores its images in
`/var/root/Library/Application Support/multipassd`. However, I couldn't
exclude that using the UI - it seems that I can't access anything under
`/var/root` from the UI.

So, am I screwed and doomed to backup those images? What if things under
`/var/root` are already excluded? It turns out that `/var/root` is included
(not excluded):
```
$ sudo tmutil  isexcluded '/var/root'
[Included]    /System/Volumes/Data/private/var/root
```
But, the MultiPass directory is excluded:

```
$ sudo tmutil  isexcluded '/var/root/Library/Application Support/multipassd'
[Excluded]    /System/Volumes/Data/private/var/root/Library/Application Support/multipassd
```

🎉
