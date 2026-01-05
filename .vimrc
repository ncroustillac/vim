" set nocompatible              " Désactiver le mode Vi pour plus de compatibilité
filetype off                  " Désactiver la détection automatique des fichiers

" Ajouter Vundle au runtime path
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
call vundle#end()

filetype plugin indent on  " Réactiver la gestion des fichiers

" add color syntax
syntax on

" special characters
set list

" space rather than tabulation
set expandtab

" tabulations length
set shiftwidth=4
set tabstop=4
set softtabstop=4

" display lines number
set number

" auto indent
set autoindent
set smartindent

" use the mouse
set mouse=a

" backup
set backup

" use system clipboard for copy/paste
set clipboard=unnamedplus

" backup into ~/.vim/backup
if filewritable(expand("~/.vim/backup")) == 2
    set backupdir=$HOME/.vim/backup
else
    if has("unix") || has("win32unix")
        call system("mkdir $HOME/.vim/backup -p")
        set backupdir=$HOME/.vim/backup
    endif
endif

" autostart for plugin explorer
autocmd VimEnter * NERDTree .
autocmd VimEnter * wincmd l

" autostart symbol explorer
let Tlist_Use_Right_Window   = 1
let Tlist_Auto_Highlight_Tag   = 1
let Tlist_Show_One_File   = 1
let Tlist_Auto_Open   = 1
autocmd VimEnter * TlistToggle 

" define the folding methods
function FoldBrace()
    if getline(v:lnum+1)[0] == '{'
        if getline(v:lnum+1) =~ '}'
            return -1               
        else
            return 1
        endif
    endif
    if getline(v:lnum+1) =~ '{'
        if getline(v:lnum+1) =~ '}'
            return -1              
        else
            return 1
        endif
    endif
    if getline(v:lnum)[0] == '}'   
        return '<1'
    endif
    return -1
endfunction

" use defined folding
" set foldexpr=FoldBrace()
" set foldmethod=expr
set foldmethod=syntax

" Show C parent function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
noremap f :call ShowFuncName() <CR>

" Show duplicate lines
noremap <C-d> :syn clear Repeat \| g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch

" Load cscope database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

nnoremap <C-A> <C-W><Left>
nnoremap <C-Z> <C-W><Right>
nnoremap <C-B> :bp<C-R>
noremap <C-RightMouse> :cs find c <C-R>=expand("<cword>")<CR><CR>
