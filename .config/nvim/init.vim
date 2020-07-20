call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'liuchengxu/vim-which-key'
  Plug 'ayu-theme/ayu-vim'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" WhichKey Configs
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

let g:which_key_map = {}
let g:which_key_sep = '→'

let g:which_key_map['a'] = [':call ToggleNetrw()'     	, 'explorer']
let g:which_key_map['t'] = ['OpenTerminal'  	, 'terminal']

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 15

function! ToggleNetrw()
      if g:NetrwIsOpen
          let i = bufnr("$")
          while (i >= 1)
              if (getbufvar(i, "&filetype") == "netrw")
                  silent exe "bwipeout " . i
              endif
              let i-=1
          endwhile
          let g:NetrwIsOpen=0
      else
          let g:NetrwIsOpen=1
          silent Lexplore
      endif
  endfunction

let g:NetrwIsOpen=0

call which_key#register('<Space>', "g:which_key_map")
