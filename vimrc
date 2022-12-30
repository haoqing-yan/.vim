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

" 分屏
set splitbelow
set splitright

" Ctrl-j 切换到下方的分割窗口
" Ctrl-k 切换到上方的分割窗口
" Ctrl-l 切换到右侧的分割窗口
" Ctrl-h 切换到左侧的分割窗口
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 关闭 vi 兼容模式 
set nocompatible

" 文件编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 

let g:python3_host_prog="/path/to/python/executable/"
"设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-autoformat/vim-autoformat'
   " 导航目录侧边栏
Plugin 'scrooloose/nerdtree'
" 使nerdtree tab标签的名称更友好
Plugin 'jistr/vim-nerdtree-tabs'
" nerdtree中看git版本信息
Plugin 'Xuyuanp/nerdtree-git-plugin'

" 代码自动补全(需要额外配置）
Plugin 'Valloric/YouCompleteMe'
" 下面两个配合 生成代码片段
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Python自动补全
Plugin 'davidhalter/jedi-vim'
" 符号自动补全
Plugin 'Raimondi/delimitMate'

" 文件搜索, 快速跳转文件
Plugin 'ctrlpvim/ctrlp.vim'
" 全局搜索
Plugin 'dyng/ctrlsf.vim'
" 大纲式导航(右边出现的那个导航的）
Plugin 'majutsushi/tagbar'
" 内容搜索
Plugin 'rking/ag.vim'
" 快速移动（跳转）
Plugin 'Lokaltog/vim-easymotion'
" 成对标签跳转
Plugin 'vim-scripts/matchit.zip'

" 快速注释
Plugin 'tomtom/tcomment_vim'
" 成对符号编辑(快速给词加环绕符号,例如单引号/双引号/括号/成对标签等)
Plugin 'tpope/vim-surround'
" 多光标操作(类似sublimetext的多光标选中)
Plugin 'terryma/vim-multiple-cursors'

" 语法检查(支持大部分语言）
Plugin 'vim-syntastic/syntastic'
" 快速对齐
Plugin 'junegunn/vim-easy-align'
" Python开发插件
Plugin 'klen/python-mode'
" Go开发插件
Plugin 'fatih/vim-go'
" Vue开发插件
Plugin 'posva/vim-vue'
" 杂项自动加载
Plugin 'xolox/vim-misc'
" 集成各种git操作
Plugin 'tpope/vim-fugitive'
" gitk
Plugin 'gregsexton/gitv'
" git差比对
Plugin 'airblade/vim-gitgutter'
" 状态栏增强显示
Plugin 'bling/vim-airline'
" 配色插件（深色/浅色）
Plugin 'noahfrederick/vim-hemisu'

Plugin 'JamshedVesuna/vim-markdown-preview'
call vundle#end()           
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

" 搜索时 忽略这些文件/夹
set wildignore+=*/.git/*,
      \*/.hg/*,*/.svn/*,
      \*/cscope*,*/*.csv/,
      \*/*.log,*tags*,*/bin/*
"NERDTree 快捷键
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Command + r/R 搜索
let g:ctrlp_map = '<D-p>'
nmap <D-r> :CtrlPBufTag<CR>
imap <D-r> <esc>:CtrlPBufTag<CR>
nmap <D-R> :CtrlPBufTagAll<CR>
imap <D-R> <esc>:CtrlPBufTagAll<CR>


" Command + / 加注释
map <D-/> :TComment<CR>
vmap <D-/> :TComment<CR>g

" python 设置
" macvim with --with-python3
let g:pymode_python = 'python3'
" close syntax when save file
let g:pymode_lint_on_write = 0


" ctrl+j/k
func! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
    endif
endfunction

func! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
    endif
endfunction
inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger = "<c-k>"

" 符号自动补全
let g:delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_space = 2
imap <expr> <TAB> delimitMate#ShouldJump() ? "<Plug>delimitMateS-Tab" : "<TAB>"
inoremap <expr> <S-Tab> delimitMate#JumpAny()

" 快速跳转
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" ,,h 显示往前可快速移动的点
map <Leader><leader>h <Plug>(easymotion-linebackward)
" ,,j 显示往下可快速移动的点
map <Leader><Leader>j <Plug>(easymotion-j)
" ,,k 显示往上可快速移动的点
map <Leader><Leader>k <Plug>(easymotion-k)
" ,,l 显示往后可快速移动的点
map <Leader><leader>l <Plug>(easymotion-lineforward)
" ,,. 显示上一次可快速移动的点
map <Leader><leader>. <Plug>(easymotion-repeat)


" git 快捷操作
" :Gdiff  :Gstatus :Gvsplit
nnoremap <leader>gtaa :Git add .<CR>
nnoremap <leader>gtc  :Gcommit<CR>
nnoremap <leader>gtp  :Gpush<CR>
nnoremap <leader>gtl  :Gpull<CR>
nnoremap <leader>gtb  :Gblame<CR>
nnoremap <leader>gtst :Gstatus<CR>
nnoremap <leader>gtd  :Gdiff<CR>
nnoremap <leader>gtlg :Glog<CR>



let vim_markdown_preview_github=1
