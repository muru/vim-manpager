# vim-manpager

A plugin that makes it easier to use Vim is `$MANPAGER`.

It:

1. Keeps the backspaces added by `man` and conceals them.
2. It uses these backspace-highlighted words to do syntax highlighting.
3. Syntax highlighting for a few more types than the default
   `syntax/man.vim` (options, environment variables, man-highlighted
    manpages, section headings, etc.).
4. Maps `K` and <kdb>Enter</kbd> to open referenced manpages.

After installing it, set `MANPAGER=vim -` in a suitable place for
environment variables:

1. `~/.pam_environment`:

 ```sh
MANPAGER='vim -'
``` 
2. `~/.profile`:

 ```sh
MANPAGER='vim -'
export MANPAGER
```

(And so on….)

Right now, it doesn't have any configurable settings.

---

## Notes

### `MANWIDTH`
If you have `set number` or similar settings which might take part of the
display width, you might want to set `MANWIDTH` to a value less than
`COLUMNS`. I use a wide terminal almost always, so I keep a fixed
`MANWIDTH`:

    MANWIDTH=80

Since the backspaces are kept, side-scrolling is ugly.

### Vim's default manpage settings

Vim has configuration and some syntax highlighting. It adds mappings for
`<c-]>` and `<c-t>`, approximating tag navigation for manpages. I've left
those alone, for now.
