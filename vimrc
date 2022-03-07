
" 快速移动 
noremap J 5j
noremap K 5k
noremap H 0
noremap L $
noremap W 5w
noremap B 5b

" my vim theme config
" 开启语法高亮功能
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

" 自动加载 vim 的配
autocmd BufWritePost $MYVIMRC source $MYVIMRC
