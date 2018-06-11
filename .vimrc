" 参考: http://www.curiosity-drives.me/2012/01/rails.html
" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" 色づけをonにする
syntax on

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<C-L>を押すと現在の強調表示を解除する）
set hlsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする。
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存するかどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを有効化
set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" タブ文字の代わりにスペース2個を使う場合の設定。
" この場合、'tabstop'はデフォルトの8から変えない。
set shiftwidth=2
set softtabstop=2
set expandtab

" インサートモードの時に C-j でノーマルモードに戻る
imap <C-j> <esc>

" Yの動作をDやCと同じにする
map Y y$

" <C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohl<CR><C-L>

" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" クリップボード共有
set clipboard+=unnamed

" 方向キーABCDのエラーを直す
set nocompatible
