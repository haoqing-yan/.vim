
" 快速移动
nnoremap H 0
nnoremap N 5j
nnoremap E 5k
nnoremap I $

" 语法高亮
syntax enable
syntax on

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行
set cursorline
" 高亮显示搜索结果
set hlsearch
"  vim 自身命令行模式智能补全
set wildmenu
" 搜索大小写不敏感
set ignorecase
" 开启实时搜索功能
set incsearch

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 分屏
set splitbelow
set splitright

" 关闭 vi 兼容模式 
set nocompatible

" 文件编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 


call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'jooize/vim-colemak'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" 文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

autocmd BufNewFile,BufRead *.define setf define
" 针对不同的文件类型 设置不同格式
" go中，不用空格代理Tab
autocmd FileType go :set tabstop=4 noexpandtab " Do not use spaces instead of tabs
" cpp c 缩进空格长度为4 用空格代替Tab
autocmd FileType c,cpp :set shiftwidth=4 expandtab
" lua 缩进空格长度为4
autocmd FileType lua :set shiftwidth=4
" sh 缩进空格长度为2 空格代理Tab
autocmd FileType sh :set shiftwidth=2 expandtab
" py 缩进空格长度为4 空格代理Tab 自动缩进
autocmd FileType python :set tabstop=4 shiftwidth=4 expandtab ai
" ruby,javascript,html,css,xml 缩进空格长度为2 空格代理Tab 自动缩进
autocmd FileType ruby,javascript,html,css,xml :set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
