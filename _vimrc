" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-syntastic/syntastic'
Plug 'tibabit/vim-templates'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/AutoComplPop'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Initialize plugin system
call plug#end()
			
"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
autocmd VimEnter * NERDTree
syntax on
" from scrooloose's blog post
" https://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set autoindent
set expandtab
set tabstop=2
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
set ai
set autochdir
set incsearch
colorscheme gruvbox
set background=dark

if has("gui_running")
	autocmd GUIEnter * set vb t_vb=
  if has("gui_win32")
    set guifont=Consolas:h14:cANSI
  endif
endif

set backspace=indent,eol,start

set makeprg=gcc\ -o\ %<\ %
"Run on bash
map <F6> :w <CR> :!gcc % -o %< && ./%< <CR>
"Run on windows
map <F6> :w <CR> :!gcc % -o %< && %< <CR>
"Java
map <F4> :!javac % && java %< <CR>

nmap <F2> <Plug>(JavaComplete-Imports-Add)
" Ctrl-Backspace to delete word
imap <C-BS> <C-W>

nnoremap <C-s> :w <CR>
nnoremap <space>q <C-w>q <CR>
nnoremap <space>h <C-w>h <CR> 
nnoremap <space>l <C-w>l <CR>
nnoremap <space>j <C-w>j <CR> 
nnoremap <space>k <C-w>k <CR> 
" Nerd tree
map <C-o> :NERDTreeToggle<CR>


autocmd FileType java setlocal omnifunc=javacomplete#Complete
