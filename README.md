# ~/NolanWoods/dotfiles

Being a collection of various config files. Use at your own risk.

With much thanks given to: [Simon Crowley](http://inescapable.org/dotfiles),
[Nicolas Gallagher](http://github.com/necolas/dotfiles),
[Tim Pope](http://github.com/tpope/vim-sensible), and countless documentation
maintainers and stackoverflow contributors.

## Installation

Clone this repository and fetch its submodules with:

````
git clone -- recursive git@github.com:NolanWoods/dotfiles.git config
````

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
