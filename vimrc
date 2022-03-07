
" quick move 
noremap J 5j
noremap K 5k
noremap H 0
noremap L $
noremap W 5w
noremap B 5b

" my vim theme config
syntax on


set wildmenu
" ignore case sensitive
set ignorecase
set number

" auto load vim configeruation on time
autocmd BufWritePost $MYVIMRC source $MYVIMRC
