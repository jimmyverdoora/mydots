" put Plug declaration first
call plug#begin('~/.vim/plugged')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug '907th/vim-auto-save'
Plug 'numirias/semshi' " remember to do :UpdateRemotePlugin, also change the default colors!
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe' " remember to do ./install.py in .vim/plugged! :)
Plug 'othree/html5.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-python/python-syntax'
call plug#end()

" let g:vim_monokai_tasty_italic = 1                    " allow italics, set this before the colorscheme
colorscheme vim-monokai-tasty                         		" set the colorscheme
hi Normal guibg=blck ctermbg=black

" Optional themes for airline/lightline
let g:airline_theme='monokai_tasty'                   " airline theme
let g:airline_powerline_fonts = 1
let g:lightline = { 'colorscheme': 'monokai_tasty' }  " lightline theme
let g:auto_save = 1 
let NERDTreeIgnore=['__pycache__', '__init__.py', '\~$']

" link the tabs
!echo 'set tags=' > /tmp/tagsmap.vim
!truncate -s-1 /tmp/tagsmap.vim
!git rev-parse --show-toplevel >> /tmp/tagsmap.vim
!truncate -s-1 /tmp/tagsmap.vim
!echo '/.tags' >> /tmp/tagsmap.vim
source /tmp/tagsmap.vim
!rm /tmp/tagsmap.vim

" `What` will print out the syntax group that the cursor is currently above.
" from https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')
command GitTags !DIREC=$(git rev-parse --show-toplevel); cd $DIREC; cd ..; ctags -R -f $DIREC/.tags --tag-relative=never 
nnoremap - /
nnoremap t <c-]> 
autocmd VimEnter * NERDTree
