" 关闭 vi 兼容模式
set nocompatible

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" vim-airline
let g:airline_powerline_fonts = 0
let g:airline_theme = 'dark'

" vim-gitgutter
let g:gitgutter_enabled = 1

" 自动补全
set hidden
set completeopt=menuone,noinsert,noselect
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

" LSP
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_document_code_action_signs_enabled = 1

" EasyMotion
let g:EasyMotion_do_mapping = 0

" Sneak
let g:sneak#label = 1

" 插件管理（vim-plug）
let s:plug_path = expand('~/.vim/autoload/plug.vim')
if empty(glob(s:plug_path)) && empty($VIM_SKIP_PLUGIN_BOOTSTRAP)
    if executable('curl')
        silent execute '!curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    else
        echohl WarningMsg
        echom 'vim-plug not found. Install it manually, then run :PlugInstall.'
        echohl None
    endif
endif

if filereadable(s:plug_path)
    call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-buffer.vim'
    Plug 'prabirshrestha/asyncomplete-file.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'justinmk/vim-sneak'
    call plug#end()
endif

filetype plugin indent on

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

" 文件编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 

augroup filetype_settings
    autocmd!
    autocmd BufNewFile,BufRead *.define setf define
    " 针对不同的文件类型 设置不同格式
    " go中，不用空格代理Tab
    autocmd FileType go setlocal tabstop=4 noexpandtab
    " cpp c 缩进空格长度为4 用空格代替Tab
    autocmd FileType c,cpp setlocal shiftwidth=4 expandtab
    " lua 缩进空格长度为4
    autocmd FileType lua setlocal shiftwidth=4
    " sh 缩进空格长度为2 空格代理Tab
    autocmd FileType sh setlocal shiftwidth=2 expandtab
    " py 缩进空格长度为4 空格代理Tab 自动缩进
    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab autoindent
    " ruby,javascript,html,css,xml 缩进空格长度为2 空格代理Tab 自动缩进
    autocmd FileType ruby,javascript,html,css,xml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent
augroup END

" 插件快捷键
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-p> :CtrlP<CR>

" 自动补全快捷键
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
imap <C-Space> <Plug>(asyncomplete_force_refresh)
imap <C-@> <Plug>(asyncomplete_force_refresh)

" LSP 跳转和诊断
nnoremap <silent> gd :LspDefinition<CR>
nnoremap <silent> gD :LspDeclaration<CR>
nnoremap <silent> gi :LspImplementation<CR>
nnoremap <silent> gr :LspReferences<CR>
nnoremap <silent> gy :LspTypeDefinition<CR>
nnoremap <silent> <leader>lh :LspHover<CR>
nnoremap <silent> <leader>lr :LspRename<CR>
nnoremap <silent> <leader>lf :LspDocumentFormat<CR>
nnoremap <silent> <leader>ld :LspDocumentDiagnostics<CR>
nnoremap <silent> [d :LspPreviousDiagnostic<CR>
nnoremap <silent> ]d :LspNextDiagnostic<CR>

" 文件内快速跳转
nmap <leader><leader>w <Plug>(easymotion-overwin-w)
nmap <leader><leader>f <Plug>(easymotion-overwin-f)
nmap <leader><leader>j <Plug>(easymotion-j)
nmap <leader><leader>k <Plug>(easymotion-k)
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

augroup completion_settings
    autocmd!
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
        \ 'name': 'buffer',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#buffer#completor'),
        \ }))
    autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'allowlist': ['*'],
        \ 'completor': function('asyncomplete#sources#file#completor'),
        \ }))
augroup END
