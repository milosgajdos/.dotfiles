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

" go-vim plugin by fatih
Plugin 'fatih/vim-go'

" Dockerfile vim plugin
Plugin 'ekalinin/Dockerfile.vim'

" Terraform plugin
Plugin 'hashivim/vim-terraform'

" python indentation
Plugin 'vim-scripts/indentpython.vim'

" You Complete Me
Plugin 'Valloric/YouCompleteMe'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" NerdTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" tag bars
Plugin 'majutsushi/tagbar'

" vim-fugitive plugin for git
Plugin 'tpope/vim-fugitive'

" powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()            " required
filetype plugin indent on    " enable file detection

" GLOBAL VIM SETTINGS
syntax on          " Always turn the syntax on
set expandtab      " Turn tab into spaces
set number         " Turn on numbering of lines
set noshowmode     " Shows vim mode
set encoding=utf-8 " set encoding to utf-8

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch   " Search incrementally
set hidden      " hides buffers when unsaved instead of warning
set autowrite   " autowrite the file

" File backups
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Enable folding
set foldmethod=indent
set foldlevel=99

" color scheme
set background=dark
colorscheme molokai
set t_Co=256

" mappeader config
let mapleader = ","
let g:mapleader = ","

" remap hjkl for sanity
noremap ' l
noremap ; k
noremap l j
noremap k h
nnoremap . ;

" Enable folding with the spacebar
nnoremap <space> za

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

" Retarded ruby indentation
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" nerdtree config
" toggle NERDTree
map `\ :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" custom git-nerd-tree symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" powerline config
let g:Powerline_symbols = 'fancy'
set laststatus=2

" ultisnips config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-k>"

" ycm config
" autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" make tensorflow and other python libs auto complete
let g:ycm_python_binary_path = 'python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" terraform config
" terraform fmt on save
let g:terraform_fmt_on_save = 1

" enable previewing of python folded classes and functions docstrings
let g:SimpylFold_docstring_preview = 1
" don't fold docstrings
let g:SimpylFold_fold_docstring = 0
" don't want import foldings
let g:SimpylFold_fold_import = 0
" see https://github.com/tmhedberg/SimpylFold/issues/27
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" Python identation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" other lang indentations
au BufNewFile,BufRead *.js, *.html, *.css, *.rb
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" vim-go settings
" Disable error checks on gofmr when saving go file
let g:go_fmt_fail_silently = 1
" all errors into quickfix list
let g:go_list_type = "quickfix"
" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
" Highlight funcs, structs and methods
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" Keyboard shortcuts
au FileType go map <C-n> :cnext<CR>
au FileType go map <C-m> :cprevious<CR>
au FileType go nnoremap <leader>a :cclose<CR>
" run build and test Go code
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

" python higlight code
let python_highlight_all=1

" traimwhitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWritePre * call TrimWhitespace()
autocmd BufWinLeave * call clearmatches()
