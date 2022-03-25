" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Plugins
call plug#begin('~/.vim/plugged')

" Easy escape using jk
Plug 'zhou13/vim-easyescape'

" Nerdtree file explorer
Plug 'preservim/nerdtree'

" T-comment
Plug 'tomtom/tcomment_vim'

" Autoclose plugin
Plug 'Townk/vim-autoclose'

" Jedi python autocomplete
Plug 'davidhalter/jedi-vim'

" Vim Surround https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" Status line
Plug 'itchyny/lightline.vim'

" Show color for hex colors
Plug 'ap/vim-css-color'

call plug#end() 

let g:easyescape_chars = { "j": 1, "k": 1 }
" let g:easyescape_timeout = 100
cnoremap jk <Esc>
cnoremap kj <Esc>
vnoremap <C-L> <Esc>
vnoremap <C-L> <Esc>

set nohls
set tabstop=4
set shiftwidth=4
set expandtab
set number

" Keybinding to toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

set splitbelow " Open terminal below
set splitright

" So that the terminal is small in size
set termwinsize=10*0

" Keybinding to open terminal
nnoremap <leader>` :terminal<CR>

" Keybinding to switch to 'Terminal-Normal mode' inside the vim terminal
tnoremap <C-n> <c-\><c-n>

" Configs for lightline.vim
set laststatus=2 " becasue the status line is not visible
set noshowmode " to not show the insert twice
let g:lightline = {
        \ 'colorscheme': 'powerlineish',
\ }
