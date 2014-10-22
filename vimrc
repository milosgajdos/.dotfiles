set nocompatible           " turn vi into vim
filetype off               " required by vundle
" VUNDLE SETUP
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()          " required
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" go-vim plugin by fatih
Plugin 'fatih/vim-go'

" vim-ruby plugin for ruby shit
Plugin 'vim-ruby/vim-ruby'

" vim-fugitive plugin for git
Plugin 'tpope/vim-fugitive'

" enabled vim-neatstatus line
Plugin 'maciakl/vim-neatstatus'

call vundle#end()            " required

filetype plugin indent on    " enable file detection
syntax on        " Always turn the syntax on
set expandtab    " Turn tab into spaces
set number       " Turn on numbering of lines
set showmatch    " Show matching brackets.
set matchtime=5  " Bracket blinking.
set noshowmode   " Shows vim mode

" set status line
set laststatus=2 " Always show status line.

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch   " Search incrementally

" color scheme
set background=dark
colorscheme molokai
set t_Co=256

let mapleader = ","
let g:mapleader = ","

" remap hjkl
noremap ' l
noremap ; k
noremap l j
noremap k h

" Fast saving
nmap <leader>w :w!<cr>
" Fast quitting
nmap <leader>q :q<cr>

" toggle the paste
map <leader>p :set paste!<CR>
" toggles search highlighting
nmap <silent> <leader>n :set hlsearch!<CR>

" Turn off auto-commenting
au FileType * setlocal formatoptions-=cro

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-k>"

" File backups
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//
