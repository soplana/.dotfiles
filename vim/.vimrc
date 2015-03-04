filetype off

augroup Reset
  autocmd!
augroup END

set autoindent
set backspace=2
set tabstop=2
set shiftwidth=1
set expandtab
set autoindent
set ts=2
set t_Co=256
syntax on
filetype on
filetype plugin on
filetype indent on
imap <C-Space> <C-x><C-o>
set vb t_vb=
set number
set ruler
set tags=tags

nnoremap + <C-W>5+
nnoremap - <C-W>5-
nnoremap < <C-W>5<
nnoremap > <C-W>5>

nmap <Space>r : %s///gc
nmap bd :bdelete<CR>
nmap SS :source ~/.vimrc<CR>

" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleCheck

NeoBundle 'gmarik/vundle'
NeoBundle 'rails.vim'
NeoBundle 'AutoComplPop'

" \rでプログラム実行
NeoBundle 'quickrun.vim'

" 任意の文字で囲むアレ
NeoBundle 'surround.vim'

" シンタックス
NeoBundle 'kchmck/vim-coffee-script'

" swift
NeoBundle "aespinosa/Swift-vim"

" haskell
NeoBundle "dag/vim2hs"
NeoBundle "eagletmt/ghcmod-vim"
NeoBundle 'Shougo/vimproc.vim', {
          \ 'build' : {
          \     'windows' : 'make -f make_mingw32.mak',
          \     'cygwin' : 'make -f make_cygwin.mak',
          \     'mac' : 'make -f make_mac.mak',
          \     'unix' : 'make -f make_unix.mak',
          \    },
          \ }

" color
NeoBundle 'desert256.vim'
NeoBundle 'wombat256.vim'
NeoBundle 'coffee.vim'
NeoBundle 'baycomb'
NeoBundle 'molokai'
NeoBundle 'pyte'
NeoBundle 'dw_colors'
NeoBundle 'Zenburn'
NeoBundle 'Solarized'
colorscheme coffee
"colorscheme molokai
"colorscheme pyte
"colorscheme desert256
"colorscheme wombat256mod
"colorscheme Zenburn
"colorscheme Solarized
set cursorline
highlight CursorLine ctermfg=Blue

" ファイラー
NeoBundle 'ctrlp.vim'
nnoremap <C-h> :<C-u>CtrlPMRUFiles<CR>

" golang
NeoBundle 'Blackrush/vim-gocode'
set rtp+=$GOROOT/misc/vim
exe "set rtp+=" . globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
filetype plugin indent on
syntax on

" javascript
NeoBundle 'JavaScript-syntax'
au FileType javascript set ts=2 sw=2 expandtab
au BufNewFile *.js set ft=javascript fenc=utf-8
nmap <Space>t :! mocha %<CR>

" ctrlp
nnoremap ss :<C-u>CtrlPMixed<CR>

" SICP用
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'git://github.com/aharisu/vim_goshrepl.git'
if !exists('g:neocomplcache_keyword_patterns')
 let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
vmap <CR> <Plug>(gosh_repl_send_block)

" 末尾の空白を消去
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 括弧などの自動補完
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>


set nocompatible
