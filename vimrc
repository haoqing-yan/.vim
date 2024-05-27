" 快速移动
nnoremap H 0
nnoremap J 5j
nnoremap K 5k
nnoremap L $

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
