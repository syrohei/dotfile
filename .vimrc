"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定

if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 今後このあたりに追加のプラグインをどんどん書いて行きます！！"

"NERDTree
NeoBundle "scrooloose/nerdtree"

NeoBundle 'tpope/vim-fugitive'
"GitHub以外のGitリポジトリにあるプラグインを利用する場合
NeoBundle 'git://git.wincent.com/command-t.git'
"Git以外のリポジトリにあるプラグインを利用する場合
NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"lightline
NeoBundle 'itchyny/lightline.vim'
"エラー訂正
NeoBundle 'git://github.com/scrooloose/syntastic.git'
"入力補完
NeoBundle 'Shougo/neocomplcache.vim'
"カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
"囲んでる系を簡単に
NeoBundle 'tpope/vim-surround'
"多機能セレクタ
NeoBundle 'kien/ctrlp.vim'
"unite.vim
NeoBundle 'Shougo/unite.vim'
"ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
"Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 0
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

NeoBundle 'kchmck/vim-coffee-script'

 call neobundle#end()
 

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

noremap <silent><S-E> :NERDTreeToggle<CR>



"--------------- キーバインド ---------------"

"Normalモード"
noremap j           gj
noremap k           gk
noremap A           ggVG
noremap <C-E>       $
noremap <C-K>       lv$hd
noremap s           :s///gc<LEFT><LEFT><LEFT><LEFT>
noremap S           :%s///gc<LEFT><LEFT><LEFT><LEFT>
noremap f           za
noremap F           zA
noremap <ESC><ESC>  :nohlsearch<CR><ESC>

"Insertモード"
inoremap <C-E>      <END>
inoremap <C-A>      <HOME>
inoremap <C-D>      <DEL>
inoremap <C-B>      <RIGHT><DEL>

inoremap <C-H>      <LEFT>
inoremap <C-J>      <DOWN>
inoremap <C-K>      <UP>
inoremap <C-L>      <RIGHT>

inoremap <C-c>      <ESC>

"Visualモード"
vnoremap <C-A>      ^
vnoremap <C-E>      $
vnoremap <TAB>      >
vnoremap s          ::s///gc<LEFT><LEFT>
vnoremap S          y:%s///gc<LEFT><LEFT><C-R>"<Right>

"コマンドモード"
cnoremap <C-H>      <LEFT>
cnoremap <C-J>      <DOWN>
cnoremap <C-K>      <UP>
cnoremap <C-L>      <RIGHT>
cnoremap <C-D>      <DEL>
cnoremap <C-B>      <RIGHT><DEL>


"-------------------------
" End Neobundle Settings.
"-------------------------
"ステータスラインを常に表示"
set laststatus=2
"現在のモードを表示"
set showmode
"タイプ途中のコマンドを表示"
set showcmd
"右下に行，列を表示"
set ruler

"--------------- encoding ---------------"
set termencoding=utf-8
set encoding=utf-8
set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=utf-8,shift-jis

"--------------- color ---------------"
syntax on
hi Folded      ctermfg=85 ctermbg=NONE
hi FoldColumn  ctermfg=85 ctermbg=NONE
"カラー設定
hi Comment ctermfg=178
"--------------- other ---------------"
"TABの幅を指定"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

"モードライン無効"
set modelines=0

"自動でインデント"
set autoindent

"行数を表示"
set number

"viとの互換なし"
set nocompatible

"タイトルをウィンドウ枠に表示" 
set title

"検索文字を打ち込むと即検索"
set incsearch

"バックスペースで改行とかも消せる"
set backspace=indent,eol,start

"バックアップファイルをとらない"
set nobackup

"スワップつくらない"
set noswapfile

"コマンドラインの履歴"
set history=500

"バッファを保存しなくても他のバッファを表示可能に"
set hidden

"viminfoファイルの設定"
set viminfo=!,'50,<1000,s100,\"50"

"対応する括弧を表示"
set showmatch

"補完候補を表示"
set wildmenu

"スクロール時の余白確保"
set scrolloff=7

set formatoptions-=ro
autocmd FileType * setlocal formatoptions-=ro

"検索結果をハイライト"
set hlsearch

"カーソルの下の単語を検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

"ファイル開いたら前回のカーソル位置へ移動
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line('$') |
        \   exe "normal! g`\"" |
        \ endif
augroup END


"--------------- Python用 ---------------"
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,for,while,try,except,finally,def,class


"--------------- lightlineの設定 -----------------"

let g:lightline = {
      \ 'colorscheme':'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' },
      \ }


"----------------- Dash.app ------------------
function! s:dash(...)
  if len(a:000) == 1 && len(a:1) == 0
    echomsg 'No keyword'
  else
    let ft = &filetype
    if &filetype == 'python'
      let ft = ft.'2'
    endif
    let ft = ft.':'
    let word = len(a:000) == 0 ? input(eyword: ', ft.expand('<cword>')) : ft.join(a:000, ' ')
    call system(printf("open dash://'%s'", word))
  endif
endfunction

command! -nargs=* Dash call <SID>dash(<f-args>)

nnoremap <Leader>d :call <SID>dash(expand('<cword>'))<CR>'



"------
"タブ機能
"----- 
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set
" tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示


" The
" prefix
" key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab
" jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1
" で1番左のタブ、t2
" で1番左から2番目のタブにジャンプ

map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tc
" 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
" tx
" タブを閉じる
map <silent> [Tag]n :tabnext<CR>
" tn
" 次のタブ
map <silent> [Tag]p :tabprevious<CR>

"-----
"Unite
"-----
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

"
""#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
