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

" Rust plugin
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" Dockerfile vim plugin
Plugin 'ekalinin/Dockerfile.vim'

" Terraform plugin
Plugin 'hashivim/vim-terraform'

" python indentation
Plugin 'vim-scripts/indentpython.vim'

" json plugin
Plugin 'elzr/vim-json'

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

" web API
Plugin 'mattn/webapi-vim'

" vim marks
Plugin 'kshenoy/vim-signature'

" multiline vs single line code
Plugin 'AndrewRadev/splitjoin.vim'

Plugin 'ctrlpvim/ctrlp.vim'

" Swift plugin
" Plugin 'bumaociyuan/vim-swift'
Plugin 'keith/swift.vim'

" DART plugin
Plugin 'dart-lang/dart-vim-plugin'

" supertab
Plugin 'ervandew/supertab'

" Powershell vim support
Plugin 'PProvost/vim-ps1'

" YAML cruft
Plugin 'Einenlum/yaml-revealer'

" Cuelang plugin
Plugin 'jjo/vim-cue'

" GraphQL plugin
Plugin 'jparise/vim-graphql'

" WASM vim support
"Plugin 'rhysd/vim-wasm'

call vundle#end()            " required
filetype plugin indent on    " enable file detection

" GLOBAL VIM SETTINGS
syntax on          " Always turn the syntax on
set expandtab      " Turn tab into spaces
set number         " Turn on numbering of lines
set noshowmode     " Shows vim mode
set encoding=utf-8 " set encoding to utf-8
set ttyfast        " Indicate fast terminal conn for faster redraw
set ttyscroll=3    " Speedup scrolling
set autoread       " Automatically read changed files
set autowrite      " autowrite the file
set noerrorbells   " No beeps on error
set splitright     " Vertical windows should be split to right
set splitbelow     " Horizontal windows should split to bottom
set noshowmatch    " Do not show matching brackets by flickering
set noshowmode     " We show the mode with airline or lightline
set pumheight=10   " Completion window max size
set lazyredraw     " Wait to redraw

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase   " be sensitive when there's a capital letter
set incsearch   " Search incrementally
set hidden      " hides buffers when unsaved instead of warning

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

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
let mapleader = "`"
let g:mapleader = "`"

" remap hjkl for sanity
noremap ; l
noremap k k
noremap l j
noremap j h
nnoremap . ;

" Enable folding with the spacebar
nnoremap <space> za

" Change ESC mapping
inoremap ;; <ESC>

" Fast saving
nmap <leader>w :w!<cr>
" Fast quitting
nmap <leader>q :q<cr>
" Fast save and quit
nmap <leader>ww :wq<cr>

" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" " Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>

" toggle the paste
nmap ,p :set paste!<CR>
" toggles search highlighting
nmap <silent> ,n :set hlsearch!<CR>
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
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
"let g:UltiSnipsExpandTrigger="<c-k>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<s-c-k>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" ycm config
" autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" make tensorflow and other python libs auto complete
let g:ycm_python_binary_path = 'python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" terraform config
" Allow vim-terraform to override your .vimrc indentation syntax for matching files
let g:terraform_align=1
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
au BufNewFile,BufRead *.js,*.html,*.css,*.rb
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" rust.vim settings
" fmt code on autosave
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
" add path to rust racer
set hidden
let g:racer_cmd = "/Users/milosgajdos/.cargo/bin/racer"
" show full function definition
let g:racer_experimental_completer = 1
" jump to definitions
au FileType rust nmap rd <Plug>(rust-def)
au FileType rust nmap rs <Plug>(rust-def-split)
au FileType rust nmap rx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>rd <Plug>(rust-doc)

" vim-go settings
" Disable error checks on gofmt when saving go file
let g:go_fmt_fail_silently = 0
" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
" all errors into quickfix list
let g:go_list_type = "quickfix"
" Highlight funcs, structs and methods
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'bodyclose', 'prealloc']
" Open :GoDeclsDir with ctrl-g
au FileType go nmap <C-g> :GoDeclsDir<cr>
au FileType go imap <C-g> <esc>:<C-u>GoDeclsDir<cr>
" Keyboard shortcuts
au FileType go map <C-n> :cnext<CR>
au FileType go map <C-m> :cprevious<CR>
au FileType go nnoremap <leader>a :cclose<CR>
" run build and test Go code
au FileType go nmap <leader>r <Plug>(go-run)
" :GoBuild and :GoTestCompile
au FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" Open the definition/declaration in a new vertical, horizontal
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>d <Plug>(go-doc)
" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>f <Plug>(go-implements)
" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>e <Plug>(go-rename)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" json config
let g:vim_json_syntax_conceal = 0

" automatic Dart file type detection
au BufRead,BufNewFile *.dart set filetype=dart
" Enable Dart style guide syntax
let dart_style_guide = 2

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" python higlight code
let python_highlight_all=1

" GraphQL prisma syntax highlighter
au BufNewFile,BufRead *.prisma setfiletype graphql

" trimwhitespace
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
