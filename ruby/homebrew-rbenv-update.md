# Updating Ruby versions with `rbenv` installed by Homebrew


When a new version of Ruby is released, and I want to use it on my Mac.

Update the toolchain to know about the latest versions of Ruby:
```
brew upgrade rbenv ruby-build
```

See which Ruby versions are availabe:
```
rbenv install -l
```

Remove `.` from `PATH` or you'll be sorry - see below.
Install the Ruby version you want.
```
rbenv install 3.3.1
```


## Why you have to remove `.` from the `PATH`
This error message at the end of the build could mean the `PATH` is wrong:
```
...
-> make install
dyld[66616]: Library not loaded: /Users/charles/.rbenv/versions/3.3.1/lib/libruby.3.3.dylib
  Referenced from: <4345E898-85DD-316C-994E-4D84691FB7AF> /private/var/folders/z4/xvnl3lcj28s_4wh85gsk51ym0000gn/T/ruby-build.20240517123803.40633.Fofsjw/ruby-3.3.1/ruby
  Reason: tried: '/Users/charles/.rbenv/versions/3.3.1/lib/libruby.3.3.dylib' (no such file), '/System/Volumes/Preboot/Cryptexes/OS/Users/charles/.rbenv/versions/3.3.1/lib/libruby.3.3.dylib' (no such file), '/Users/charles/.rbenv/versions/3.3.1/lib/libruby.3.3.dylib' (no such file)
```
Solution courtesy of: https://github.com/rbenv/ruby-build/issues/1715
