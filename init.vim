set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,iso-2022-jp,ucs-bom,euc-jp,sjis,default,latin,utf16le
set fileformats=unix,mac,dos
set fileformat=unix
set termencoding=utf-8
set helplang=ja,en
set nobomb

call plug#begin()
  Plug 'vim-jp/vimdoc-ja'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'lighttiger2505/sqls.vim'
call plug#end()

"lsp setting------------------------------
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> gy <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    #set foldmethod=expr
    #  \ foldexpr=lsp#ui#vim#folding#foldexpr()
    #  \ foldtext=lsp#ui#vim#folding#foldtext()
endfunction
#let g:lsp_fold_enabled = 0

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"End lsp setting------------------------------

"Plugin setting----------------------------------
let g:user_emmet_settings = { 'html' : { 'lang' : 'ja' }, }
nnoremap <C-p> :Files<CR>
"End scripts setting------------------------------

"set completeopt=noinsert,menuone,noselect
"set wildmenu
"set wildmode=list:longest,full "コマンドラインモードでTABキーによるファイル名補完を有効にする
"set clipboard+=unnamed "ヤンクのときにクリップボードにもコピー
"set visualbell "音が鳴らないように
"set backupdir=$HOME/.vim_tmp
"set directory=$HOME/.vim_tmp
"set undodir=$HOME/.vim_tmp
"set formatoptions=q "自動改行オフ
"set linebreak       "いい感じのところで折り返す
"set breakindent     "折り返し後のインデント有効
"set breakindentopt=shift:2

set expandtab       "タブ入力のスペース置き換え
set tabstop=2       "タブ文字の文字数
set shiftwidth=2    "追加タブ幅
set softtabstop=2   "タブキー・バックスペースキー幅
set autoindent      "改行時のインデント継続
set smartindent     "改行時インデント自動増減
"set ambiwidth=double "記号表示対応
set ambiwidth=single
set sh=bash

augroup fileTypeConf
    autocmd!
    autocmd fileTypeConf BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd fileTypeConf FileType go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
    autocmd fileTypeConf BufWinEnter *.txt setlocal filetype=dokuwiki
augroup END

"autocmd FileType json syntax match Comment +\/\/.\+$+
"" Vim 起動時に非点滅のブロックタイプのカーソル
""let &t_ti.="\e[2 q"
"let &t_ti.="\e[6 q"
"" ノーマルモード時に非点滅のブロックタイプのカーソル
"let &t_EI .= "\e[6 q"
"" 挿入モード時に非点滅の縦棒タイプのカーソル
"let &t_SI .= "\e[5 q"
""\e[1 q, \e[5 q, \e[3 q
"" 置換モード時に非点滅の下線タイプのカーソル
"let &t_SR .= "\e[4 q"
"" vim 終了時にカーソルを mintty のデフォルトに設定
"let &t_te.="\e[0 q"

set termguicolors
colorscheme desert
"colorscheme evening
"colorscheme slate
autocmd ColorScheme * highlight Pmenu guibg=#b4009e
let g:terminal_color_4  = "#669acd" "blue

syntax on

