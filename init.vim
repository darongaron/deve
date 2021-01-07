set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
"set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set fileencodings=utf-8,cp932,iso-2022-jp,ucs-bom,euc-jp,default,latin,utf16le
set helplang=ja,en

" ----for coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
" set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
" ---- end for coc 

call plug#begin()
  Plug 'vim-jp/vimdoc-ja'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'tyru/eskk.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'rust-lang/rust.vim'
  "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-key-bindings' }
  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf'
  "Plug '/usr/bin/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'evidens/vim-twig'
  Plug 'nblock/vim-dokuwiki'
  Plug 'cespare/vim-toml'
  Plug 'leafgarland/typescript-vim'
  "Plug 'chriskempson/base16-vim'
call plug#end()

"Plugin setting----------------------------------
let g:user_emmet_settings = { 'lang' : 'ja' }
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-lists', 'coc-python', 'coc-phpls', 'coc-rust-analyzer']
nnoremap <C-p> :Files<CR>
"End scripts setting------------------------------

set completeopt=noinsert,menuone,noselect

set expandtab       "タブ入力のスペース置き換え
set tabstop=2       "タブ文字の文字数
set shiftwidth=2    "追加タブ幅
set softtabstop=2   "タブキー・バックスペースキー幅
set autoindent      "改行時のインデント継続
set smartindent     "改行時インデント自動増減
"set ambiwidth=double "記号表示対応
set ambiwidth=single
set sh=bash

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END

set termguicolors
"colorscheme base16-phd
"colorscheme base16-ocean
"colorscheme base16-flat
"colorscheme base16-brushtrees-dark
"colorscheme base16-unikitty-dark
"colorscheme base16-gruvbox-dark-pale
"colorscheme base16-tomorrow-night-eighties
colorscheme desert
autocmd ColorScheme * highlight Pmenu guibg=#b4009e
let g:terminal_color_4  = "#669acd" "blue

syntax on

