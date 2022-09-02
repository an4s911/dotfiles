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

" Conquer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autoclose html tags
Plug 'alvan/vim-closetag'

" Emmet features in vim
Plug 'mattn/emmet-vim'

" Startify welcome screen
Plug 'mhinz/vim-startify'

" Show color for colors codes
" golang must be installed before the plugin
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Vim Wiki for taking notes and what not
" For writing markdown basically
Plug 'vimwiki/vimwiki'

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
set termguicolors

" Keybinding to toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>

set splitbelow " Open terminal below
set splitright


" Keybinding to open terminal
nnoremap <leader>` :terminal<CR>

" Keybindings to move through windows 
nnoremap <C-\>j <C-w>j
nnoremap <C-\>k <C-w>k
nnoremap <C-\>l <C-w>l
nnoremap <C-\>h <C-w>h

tnoremap <C-\>j <C-w>j
tnoremap <C-\>k <C-w>k
tnoremap <C-\>l <C-w>l
tnoremap <C-\>h <C-w>h

" Keybinding to switch to 'Terminal-Normal mode' inside the vim terminal
tnoremap <C-n> <c-\><c-n>

" Configs for lightline.vim
set laststatus=2 " becasue the status line is not visible
set noshowmode " to not show the insert twice
let g:lightline = {
        \ 'colorscheme': 'powerlineish',
\ }


" Startify options
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, ]

" Hexokinase options
let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_ftOptInPatterns = {
\     'css': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'html': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'javascript': 'full_hex,rgb,rgba,hsl,hsla,colour_names',
\     'cfg': 'full_hex',
\     'dosini': 'full_hex',
\     'i3config': 'full_hex',
\ }

" VimWiki options
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{'path': '~/Documents/Notes/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
