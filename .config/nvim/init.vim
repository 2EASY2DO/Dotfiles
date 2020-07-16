call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'liuchengxu/vim-which-key'
  Plug 'ayu-theme/ayu-vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'arcticicestudio/nord-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mhinz/vim-startify' 
call plug#end()

" GENERAL CONFIGURATIONS

set notimeout

" changing leader key
let mapleader=" "

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
"Config Section

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

if (has("termguicolors"))
 set termguicolors
endif

set background=dark
let ayucolor="dark"
colorscheme ayu

" Plugins Configs

"Lightline Config

let g:lightline = { 'colorscheme': 'challenger_deep'}

" Coc Configs

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" WhichKey Configs
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:which_key_map = {}
let g:which_key_sep = '→'

let g:which_key_map['a'] = ['NERDTreeToggle'     , 'explorer']
let g:which_key_map['t'] = ['OpenTerminal'  , 'terminal']

call which_key#register('<Space>', "g:which_key_map")
