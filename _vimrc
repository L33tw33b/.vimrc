" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'

"coc
"Install language server: :CocInstall coc-[language]
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Ultisnips
Plug 'SirVer/ultisnips'

Plug 'prettier/vim-prettier'
"Plug 'vim-syntastic/syntastic'
Plug 'tibabit/vim-templates'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'dense-analysis/ale'
"Plug 'vim-scripts/AutoComplPop'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
" Initialize plugin system
call plug#end()
			
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:vim_jsx_pretty_colorful_config = 1

syntax on
" from scrooloose's blog post
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

"Indent
set autoindent
set sidescroll=1
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set laststatus=2
set noerrorbells
set noshowmode
set mouse=a
set relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nu
set autochdir
set guioptions -=T
set incsearch
colorscheme gruvbox
set background=dark
set encoding=utf-8

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

language en                 " sets the language of the messages / ui (vim)


set guifont=Consolas:h14:cANSI


set backspace=indent,eol,start

set makeprg=gcc\ -o\ %<\ %
"Run on bash
map <F6> :w <CR> :!gcc % -o %< && ./%< <CR>
"Run on windows
map <F6> :w <CR> :!gcc % -o %< && %< <CR>
"Java
map <F4> :!javac % && java %< <CR>

" Ctrl-Backspace to delete word
imap <C-BS> <C-W>

nnoremap <C-s> :w <CR>

" Nerd tree
map <C-o> :NERDTreeToggle<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Navigating tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabm -1<CR>
nnoremap <silent> <A-Right> :tabm +1<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" FORMATTERS (prettier)
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css
au FileType php setlocal formatprg=prettier\ --parser\ php
