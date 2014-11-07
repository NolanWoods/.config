
" Use Vim settings rather than vi.
" (not quite unnecessary: http://stackoverflow.com/questions/5845557/)
set nocompatible

" ------- Appearance ---------------------------------------------------------

set number
if v:version >= 703
    set relativenumber
endif

set showmode                            " show current mode
set cmdheight=2                         " more room for messages
set shortmess=a                         " use abbreviated messages

set list
set listchars=tab:>\ ,trail:·,extends:»,precedes:«,nbsp:¬

" ------- Behaviour ----------------------------------------------------------

set backspace=indent,eol,start          " enable reasonable backspacing
set tabstop=8                           " default for actual tabs
set shiftwidth=4 softtabstop=4 expandtab smarttab   " but use softtabs instead
set shiftround                          " < and > to the nearest shiftwidth

set wrap 
if has("linebreak")
    set linebreak
    set breakat=\ ^I!@*-+;:,./?         " default
endif

set scrolloff=3                         " start scrolling before the edge

" ------- Completion ---------------------------------------------------------

if has("wildmenu")
    set wildmenu
    set wildmode=list:longest,full      " list & partial complete, then full
    if has("wildignore")
        set wildignore+=*.dll,*.o,*.pdb,*.pyc
        set wildignore+=*.bmp,*.gif,*.ico,*.jpeg,*.jpg,*.png,*.tif
        set wildignore+=*.mp3,*.m4a
        set wildignore+=.DS_Store,.git,.hg,.svn
        set wildignore+=*~,*.sw?,*.tmp
    endif
endif

" ------- Environment --------------------------------------------------------

set backup
set backupdir=$HOME/.vim/temp/backups

set swapfile
set updatecount=42                      " default: 200
set directory=$HOME/.vim/temp/swaps//   " // = include path in swap name
if has("persistent_undo")
    set undofile
    set undodir=$HOME/.vim/temp/undo
endif
set viminfo+=n$HOME/.vim/.viminfo

" ------- Searching ----------------------------------------------------------

set ignorecase smartcase                " case insensitive unless you aren't
set incsearch wrapscan                  " incremental, wrap-around
set hlsearch                        " highlight last match (use :noh to clear)
set gdefault                            " replace globally on lines

" ------- Syntax -------------------------------------------------------------

if has("autocmd")
    filetype plugin indent on           " use filetype plugins and indenting
else
    set autoindent                      " fall back to autoindent
endif

if has("syntax")
    set nocursorline nocursorcolumn     " too noisy
    set colorcolumn=80
    syntax on
endif

" ------- Status Line --------------------------------------------------------

if has("cmdline_info")
    set ruler                           " show cursor position 
    set showcmd                         " show partial commands in status line
endif

if has("statusline")

    set title                           " enable setting window title

    " status line (0=never, 1=only if windows>1, 2=always)
    set laststatus=2                    " overrides ruler

    set statusline=%<%F\                " full filename, front-truncated
    set statusline+=%([%M%R]%)\         " modified & readonly flags
    set statusline+=%y\                 " filetype

    " display a warning if file encoding isn't utf-8
    set statusline+=%#StatusLineErr#
    set statusline+=%(%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}%*\ %)
    set statusline+=%*

    " display a warning if fileformat != unix
    set statusline+=%#StatusLineErr#
    set statusline+=%(%{&ff!='unix'?'['.&ff.']':''}%*\ %)
    set statusline+=%*

    set statusline+=%=                          " start of right side
    set statusline+=\ [%{getcwd()}]\            " working dir
    set statusline+=%20.(%c,%l/%L\ (%p%%)%)     " col,line/lines (percent%)

endif " has("statusline")

hi! link StatusLineErr StatusLine
hi StatusLineErr cterm=none    ctermbg=1     ctermfg=8
hi StatusLineErr gui=none      guibg=#dc322f guifg=#002b36

" ------- Rebindings --------------------------------------------------------

" make Y work from the cursor to the end of the line (which is more logical)
nnoremap Y y$

" faster scrolling (4 lines at a time)
nnoremap <C-e> 3<C-e>
vnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-y> 3<C-y>

" ------- Autocommands -------------------------------------------------------

if has("autocmd")

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    function! RestoreCursor()
        if line("'\"") <= line("$")
            normal! g`"
            normal! z.
            return 1
        endif
    endfunction

    augroup restoreCursor
        autocmd!
        autocmd BufWinEnter * call RestoreCursor()
    augroup END

endif "has autocmd
