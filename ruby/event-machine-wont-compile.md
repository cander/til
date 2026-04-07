# EventMachine won't compile

I installed Ruby 4.0.1 with rbenv, and everything seemed fine. Then, I went to update the
version of Jekyll I was using for a site, and it failed trying to build EventMachine
with some cryptic error message, which, alas, I didn't save.

Googling around, I found this issue on GitHub talking about it -
https://github.com/eventmachine/eventmachine/issues/1010

In some other issue, I was able to find a command that diagosed the problem:

```
ruby -rrbconfig -e 'puts RbConfig::CONFIG["CXX"]'
```

It should say something like `xcrun clang++`, but it just said `false`.

The solution was to uninstall Ruby 4.0.1 and re-install the Xcode command line tools.
The problem was that I had upgraded Mac OS before installing 4.0.1, and the C++ 
compiler wasn't installed. After that, I reinstalled Ruby 4.0.1 and `bundle install` happily
built EventMachine
