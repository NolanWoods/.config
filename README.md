# ~/NolanWoods/.config

Being a collection of various config files put here for my own convenience and
reference. Use at your own risk.

With much thanks given to: [Simon Crowley](http://inescapable.org/dotfiles),
[Nicolas Gallagher](http://github.com/necolas/dotfiles),
[Tim Pope](http://github.com/tpope/vim-sensible), and countless documentation
maintainers and stackoverflow contributors.

## Installation

Clone this repository and fetch its submodules with:

````
git clone -- recursive git@github.com:NolanWoods/dotfiles.git config
````

Or, if you've forgotten to clone recursively, clone the submodules with `git submodule init && git submodule update`

Then you have to manually symlink the appropriate files and directories
(for now!).

## Bash

- flow-control disabled (so I can have `<C-s>` for Save in Vim)
- git prompt and completion
- various lazy aliases

## Vim

- Various [sensible](https://github.com/tpope/vim-sensible) defaults, and
  [pathogen](https://github.com/tpope/vim-pathogen)
- `<F2>` to toggle paste
- `<C-s>` to save the current file (even in Insert mode)
- `,vr` reload .vimrc
- `,$` remove trailing whitespace (also, on save for various filetypes)

### [vim-commentary](https://github.com/tpope/vim-commentary)

- `[N] gcc` comment/uncomment N lines
- `gc` comment/uncomment the motion or visual selection

### [vim-unimpaired](/Users/kwirq/config/README.md)

- `[e` and `]e` **swap the current line with the one above/below it**
- `[<Space>` and `]<Space>` add newlines before/after the current line
- `yo` and `yO` to invoke `o` and `O` in Paste mode and revert it after
- `<P`, `=P`, `>P`, and `<p`, `=p`, `>p` to do linewise pasting with lesser,
  equal, or more indentation.
- `[xx` and `]xx` XML encode/decode, `[uu` and `]uu` for URLs, and `[yy` and
  `]yy` for C Strings. These also accept motions instead of the last character
  or visual selections.
- Use `[o_`, `]o_` and `co_` to turn on, off, and toggle
  settings, where _ is one of:
     `b`ackground, `c`ursorline, `d`iff, `h`lsearch,
     `i`gnorecase, `l`ist, `n`umber, `r`elativenumber, `s`pell,
     c`u`ursorcolumn, `v`virtualedit, `w`rap, `x` - cursorline+col
- Use `[A`, `[a`, `]a`, `]A` to jump to the first, previous, next, and last
  file from args. Similarly with `b` for buffers, `l` for locations, `q` for
  quickfixes, `t` for matching tags, `f` for files in the current file's
  directory, and `n` for SCM conflict markers.


[vim-repeat](https://github.com/tpope/vim-repeat): Make the above plugins (and
others', if they integrate) work with the `.` command.
