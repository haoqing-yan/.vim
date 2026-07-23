" 关闭 vi 兼容模式
set nocompatible
let mapleader = ' '
let maplocalleader = ' '

" NERDTree
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeMinimalUI=1
let NERDTreeWinSize=32
let g:NERDTreeWinPos='left'
let NERDTreeDirArrowExpandable='>'
let NERDTreeDirArrowCollapsible='v'

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'codedark'
let g:airline#extensions#tabline#enabled = 0

" vim-buftabline：在顶部为每个打开的文件显示一个标签
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1

" Markdown 编辑与预览
" 兼容已经启动的旧会话：禁用已移除的浏览器预览插件自动打开浏览器。
let g:mkdp_auto_start = 0
let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0

" vim-gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '-'

" vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1

" Vista
let g:vista_default_executive = 'vim_lsp'
let g:vista_sidebar_width = 32

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.85 } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" 自动补全
set hidden
set completeopt=menuone,noinsert,noselect
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0

" LSP
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_document_code_action_signs_enabled = 1
let g:lsp_settings_filetype_java = ['eclipse-jdt-ls']

" Java syntax
let g:java_ignore_markdown = 1
let g:java_highlight_all = 1

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
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ap/vim-buftabline'
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    if has('nvim')
        Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
        Plug 'MeanderingProgrammer/render-markdown.nvim'
    endif
    Plug 'tomasiser/vim-code-dark'
    Plug 'sheerun/vim-polyglot'
    Plug 'uiiaoo/java-syntax.vim'
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
    Plug 'liuchengxu/vista.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    call plug#end()
endif

filetype plugin indent on

" VSCode-like workbench
if has('termguicolors')
    set termguicolors
endif
set background=dark
try
    colorscheme codedark
catch
    colorscheme slate
endtry
set showtabline=2
set signcolumn=yes
" 不让当前编辑窗口挤压固定宽度的 Markdown 预览分屏。
set winwidth=16
set winminwidth=16
set scrolloff=6
set sidescrolloff=8
set mouse=a
set updatetime=300
if has('clipboard')
    set clipboard=unnamed
endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=m
    set guioptions-=r
    set guioptions-=L
    set lines=42
    set columns=140
    set guifont=MesloLGS\ NF:h14
endif

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
" 显示空格、制表符和行尾多余空白
set list
set listchars=space:·,tab:»·,trail:·,extends:>,precedes:<,nbsp:+
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
nnoremap <silent> <leader>e :NERDTreeFind<CR>
nnoremap <silent> <leader>tw :vertical resize 40<CR>
nnoremap <silent> <leader>o :Vista!!<CR>
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <leader>fg :Rg<Space>
nnoremap <leader>/ :Rg<Space>
nnoremap <silent> <leader>fw :call VimConfigRg(expand('<cword>'), 0)<CR>
nnoremap <silent> <leader>ts :set list!<CR>
nnoremap <silent> <leader>bn :call VimConfigBufferAction('next')<CR>
nnoremap <silent> <leader>bp :call VimConfigBufferAction('previous')<CR>
nnoremap <silent> <leader>bd :call VimConfigBufferAction('delete')<CR>
nnoremap <silent> <leader>mp :call VimConfigMarkdownPreview()<CR>
nnoremap <silent> <leader>mt :Toc<CR>

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

command! -bang -nargs=* Rg call VimConfigRg(<q-args>, <bang>0)

function! VimConfigRg(query, fullscreen) abort
    if !exists(':Files')
        echohl WarningMsg
        echom 'fzf.vim not loaded. Run :PlugInstall first.'
        echohl None
        return
    endif

    let l:query = a:query
    if empty(l:query)
        let l:query = input('Rg> ')
    endif
    if empty(l:query)
        return
    endif

    let l:command = 'rg --column --line-number --no-heading --color=always --smart-case --hidden --glob "!.git/*" -- ' . shellescape(l:query)
    try
        call fzf#vim#grep(l:command, 1, fzf#vim#with_preview(), a:fullscreen)
    catch
        echohl ErrorMsg
        echom 'Project search failed: ' . v:exception
        echohl None
    endtry
endfunction

" 从文件树触发时，先回到编辑窗口，避免切换 buffer 时替换 NERDTree。
function! VimConfigBufferAction(action) abort
    if &filetype ==# 'nerdtree'
        wincmd p
    endif

    if a:action ==# 'next'
        bnext
    elseif a:action ==# 'previous'
        bprevious
    elseif a:action ==# 'delete'
        bdelete
    endif
endfunction

" 在右侧分屏用 Glow 渲染 Markdown；打开 .md 文件和每次保存时自动更新。
function! s:MarkdownPreviewWindow(source) abort
    for l:window in range(1, winnr('$'))
        let l:buffer = winbufnr(l:window)
        if getbufvar(l:buffer, 'vim_config_markdown_preview_source', '') ==# a:source
            return l:window
        endif
    endfor
    return 0
endfunction

function! VimConfigMarkdownPreview(...) abort
    if &filetype !=# 'markdown'
        echohl WarningMsg
        echom 'Markdown preview is only available in Markdown files.'
        echohl None
        return
    endif
    if !executable('glow')
        echohl WarningMsg
        echom 'Glow is not installed. Install it with: brew install glow'
        echohl None
        return
    endif

    let l:source = expand('%:p')
    if empty(l:source)
        return
    endif
    let l:preview_window = s:MarkdownPreviewWindow(l:source)
    if l:preview_window > 0
        execute l:preview_window . 'wincmd w'
        return
    endif

    let l:source_window = winnr()
    botright vertical new
    vertical resize 60
    execute 'terminal ++curwin glow --style dark --pager ' . fnameescape(l:source)
    let b:vim_config_markdown_preview_source = l:source
    setlocal nonumber norelativenumber signcolumn=no nolist winfixwidth
    execute l:source_window . 'wincmd w'
endfunction

function! VimConfigRefreshMarkdownPreview() abort
    if &filetype !=# 'markdown' || !executable('glow')
        return
    endif

    let l:source = expand('%:p')
    let l:preview_window = s:MarkdownPreviewWindow(l:source)
    if l:preview_window == 0
        call VimConfigMarkdownPreview()
        return
    endif

    let l:source_window = winnr()
    execute l:preview_window . 'wincmd w'
    silent! bwipeout!
    execute 'terminal ++curwin glow --style dark --pager ' . fnameescape(l:source)
    let b:vim_config_markdown_preview_source = l:source
    setlocal nonumber norelativenumber signcolumn=no nolist winfixwidth
    execute l:source_window . 'wincmd w'
endfunction

function! VimConfigCloseMarkdownPreviews() abort
    let l:source_window = win_getid()
    for l:window in reverse(range(1, winnr('$')))
        let l:buffer = winbufnr(l:window)
        if !empty(getbufvar(l:buffer, 'vim_config_markdown_preview_source', ''))
            execute l:window . 'wincmd w'
            close
        endif
    endfor
    call win_gotoid(l:source_window)
endfunction

augroup workbench_settings
    autocmd!
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * call VimConfigOpenWorkbenchLayout()
    if !has('nvim')
        autocmd FileType markdown call VimConfigMarkdownPreview()
        autocmd BufWritePost *.md call VimConfigRefreshMarkdownPreview()
        autocmd BufEnter * if &filetype !=# 'markdown' && empty(get(b:, 'vim_config_markdown_preview_source', '')) | call VimConfigCloseMarkdownPreviews() | endif
    endif
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
        \ quit |
        \ endif
augroup END

function! VimConfigOpenWorkbenchLayout() abort
    if exists('s:std_in') || !exists(':NERDTree')
        return
    endif

    if argc() == 0
        let l:root = getcwd()
        enew
        execute 'NERDTreeToggle' fnameescape(l:root)
        wincmd p
        return
    endif

    if argc() == 1 && isdirectory(argv()[0])
        let l:root = fnamemodify(argv()[0], ':p')
        execute 'cd ' . fnameescape(l:root)
        enew
        execute 'NERDTreeToggle' fnameescape(l:root)
        wincmd p
        return
    endif

    if argc() == 1 && filereadable(argv()[0])
        let l:file = fnamemodify(argv()[0], ':p')
        execute 'cd ' . fnameescape(fnamemodify(l:file, ':h'))
        silent! NERDTreeFind
        wincmd p
        return
    endif

    execute 'NERDTreeToggle' fnameescape(getcwd())
    wincmd p
endfunction
