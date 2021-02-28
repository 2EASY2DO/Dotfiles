" Initialize plugin system
call plug#begin('~/.vim/plugged')
 Plug 'sainnhe/gruvbox-material'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'preservim/nerdtree'
 Plug 'ryanoasis/vim-devicons'
call plug#end()
" ====General Configs====
let mapleader=" "
" Change window control shortcuts to Alt+Arrows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
colorscheme gruvbox-material

" Disable line numbers
set nonumber
" Don't show last command
set noshowcmd
" Yank and paste with the system clipboard
set clipboard=unnamed
" Hides buffers instead of closing them
set hidden

" TAB/Space settings "
" Insert spaces when TAB is pressed.
set expandtab
" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2
" Indentation amount for < and > commands.
set shiftwidth=2
" do not wrap long lines by default
set nowrap
" Don't highlight current cursor line
set nocursorline
" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler
" Only one line for command line
set cmdheight=1
" === Completion Settings === "
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Plugins shortcuts

nnoremap <leader>e :NERDTreeToggle<CR>

" ==== Plugins Configs====
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', "coc-vetur", "coc-python"]
