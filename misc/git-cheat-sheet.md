# Git Cheat Sheet
This isn't intended as an exhaustive reference for git.  Rather, it's a collection of operations
that I perform so rarely that I always have to look up how to do them.
## Fetch Just One Remote Branch
(because I have a weak-ass Internet connection at home)

```git fetch  --no-tags <remote> <remote-branch-name>:<local-branch-name>```

## Abandon a Merge
```git reset --hard HEAD```

*Be careful you didn't have any uncommitted changes changes before you started the merge.*

```git reset --merge```
Works on non-ancient versions (>1.6.1) of git.

## Undo Last Commit
Undo a commit, leave the files in the commit staged, and don't monkey with other files in the working copy (e.g., not ```HARD``` reset)

```git reset --soft HEAD~```

## Fetch a Specific Version of a File
```git show REV:PATH/TO/FILE```

## Rebase Interactive to Edit, Squash or otherwise Abuse History
An example - [Git Interactive Rebase, Squash, Amend and Other Ways of Rewriting History](https://robots.thoughtbot.com/git-interactive-rebase-squash-amend-rewriting-history)

## Comparing Branches
Show me what's in ```master``` that isn't in ```production``` yet.

```git log production..master```

## Show Differences for a File between Branches
Show me how this file differs between ```master``` and ```production```.

```git diff master production -- file```

```file``` can also be a directory.  The ```--``` is optional in some cases.

## Disallow Pushes to a Remote
Make it double-extra impossible to push to the ```upstream``` repo

```git remote set-url --push upstream no-push```
