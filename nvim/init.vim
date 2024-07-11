" ============================================
" basic & view
" ============================================
colors default
set langmenu=en_US.UTF-8
language messages en_US.UTF-8

if has("nvim")
  set signcolumn=yes:1
else
  set signcolumn=number
endif

set nocompatible
set nu
set rnu
set showcmd
set nowrap
set hlsearch
set ignorecase
set smartcase
set wildmenu
set scrolloff=5
syntax on
filetype plugin indent on

" ============================================
" editing
" ============================================
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set backspace=2
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nojoinspaces
set eol
nmap 0 ^

" ============================================
" backup
" ============================================
set nobackup
set nowritebackup
set noswapfile

" ============================================
" Plugin
" ============================================
" Automatic installation vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" colors
Plug 'ayu-theme/ayu-vim'
Plug 'sickill/vim-monokai'
Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'spf13/vim-autoclose'

Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules|dist|build|coverage)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'jparise/vim-graphql'

Plug 'ycm-core/YouCompleteMe'

"  https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" let g:coc_global_extensions = [
"       \ 'coc-tsserver'
"       \ ]
" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif
" 
" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call CocAction('doHover')<CR>
" 
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" 
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif
" 
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction
" 
" function! s:show_hover_doc()
"   call timer_start(500, 'ShowDocIfNoDiagnostic')
" endfunction
" 
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
      \ 'do': 'npm install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
call plug#end()

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint', 'prettier'],
\}
let g:ale_fix_on_save = 1

map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeFind<CR>


let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let g:airline_theme='ayu_dark'

" ============================================
" custom view
" 256 colors: http://guns.github.io/xterm-color-table.vim/images/xterm-color-table-with-visible-rgb.png
" ============================================
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" cursor for normal mode and insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" my theme
set termguicolors
set cursorline
"let ayucolor="light"  " for light version of theme
let ayucolor="dark"   " for dark version of theme
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
hi CursorLineNr cterm=bold ctermfg=0
hi lineNr cterm=italic ctermfg=8
hi Comment cterm=italic ctermfg=8
hi Pmenu guifg=black guibg=#f1e5bc
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=NONE
hi SignColumn ctermbg=NONE
hi Split ctermbg=NONE guibg=NONE guifg=NONE

" " Output the current syntax group
nnoremap <f13> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>




" ============================================
" #keyMapping global key mappings
" ============================================
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap S :w<CR>
nnoremap R :w<CR>:source ~/.vim/vimrc<CR>
nnoremap Q :q<CR>
nnoremap <Leader>rc :e $MYVIMRC<CR>
" run python file
"
" Explanation:
" 
" autocmd: command that Vim will execute automatically on {event} (here: if you open a python file)
" [i]map: creates a keyboard shortcut to <F9> in insert/normal mode
" <buffer>: If multiple buffers/files are open: just use the active one
" <esc>: leaving insert mode
" :w<CR>: saves your file
" !: runs the following command in your shell (try :!ls)
" %: is replaced by the filename of your active buffer. But since it can contain things like whitespace and other "bad" stuff it is better practise not to write :python %, but use:
" shellescape: escape the special characters. The 1 means with a backslash
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <ESC>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
nmap <Leader>rr <F5>


