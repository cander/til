Vim Cheat Sheet
===============
FYI - this is not a general-purpose cheat sheet for vim.  I've been using vim/vim for over 35 years.
So, this is more of list of random things in core-vim or various plugin-ins that I've recently started using or am strugging to remember when I need them.

Tags
----
Use [exerberant ctags](http://ctags.sourceforge.net/) for best results.  (It's not the default `ctags` program on MacOS.)

    g-]          Search for the tag under the cursor and select between multiple possible matches.

Formatting
----------

    gq}          Format the rest of the current paragraph, wapping lines
    gqG          Format the rest of the file

Ctrl-P
------
[Ctrl-P](https://kien.github.io/ctrlp.vim/) provides fuzzy matching for file, path, and buffer names. Once it starts:

    ctrl-r        Toggle regexp mode - useful when you want to make the matching less fuzzy to search for sequential characters.
    ctrl-f ctrl-b Cycle through the modes - matching files, buffers, or MRU files
    ctlr-d        Toggle between file name vs. path name matching
    F5            Refresh the list of files - useful if you just moved a bunch of files around.

