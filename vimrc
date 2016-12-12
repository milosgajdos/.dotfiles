set nocompatible           " turn vi into vim
filetype off               " required by vundle
" VUNDLE SETUP
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()          " required
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" vim-ruby plugin
Plugin 'vim-ruby/vim-ruby'

" vim-elixir
Plugin 'elixir-lang/vim-elixir'

" Dockerfile vim plugin
Plugin 'ekalinin/Dockerfile.vim'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" go-vim plugin by fatih
Plugin 'fatih/vim-go'

" tag bars
Plugin 'majutsushi/tagbar'

" vim-fugitive plugin for git
Plugin 'tpope/vim-fugitive'

" enabled vim-neatstatus line
Plugin 'maciakl/vim-neatstatus'

" Ansible vim plugin
Plugin 'chase/vim-ansible-yaml'

" syntastic
"Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " enable file detection

syntax on        " Always turn the syntax on
set expandtab    " Turn tab into spaces
set number       " Turn on numbering of lines
set noshowmode   " Shows vim mode

" Retarded ruby indentation
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

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
nnoremap . ;

" Change ESC mapping
inoremap ;; <ESC>

" Fast saving
nmap `w :w!<cr>
" Fast quitting
nmap `q :q<cr>
" Fast save and quit
nmap `ww :wq<cr>

" toggle the paste
map <leader>p :set paste!<CR>
" toggles search highlighting
nmap <silent> <leader>n :set hlsearch!<CR>
" Toggle the Tagbar
nmap <F8> :TagbarToggle<CR>

" Turn off auto-commenting
au FileType * setlocal formatoptions-=cro

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-k>"

" Ansible plugin config
let g:ansible_options = {'ignore_blank_lines': 0}

" vim-go settings
" Disable error checks on gofmr when saving go file
let g:go_fmt_fail_silently = 1
" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" Highlight funcs, structs and methods
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" Command shortcuts
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
" Open the definition/declaration in a new vertical, horizontal
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

" File backups
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:syntastic_elixir_checkers = ['elixir']
" let g:syntastic_enable_elixir_checker = 1

" traimwhitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * call TrimWhitespace()
autocmd BufWinLeave * call clearmatches()
