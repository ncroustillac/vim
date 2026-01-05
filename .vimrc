" === CONFIGURATION VIM OPTIMISÉE POUR C/PYTHON ===
" Auteur: Configuration générée pour ncc
" Date: 2026-01-05

" Désactiver la compatibilité Vi
set nocompatible

" === GESTIONNAIRE DE PLUGINS (vim-plug) ===
call plug#begin('~/.vim/plugged')

" -- Navigation et fichiers --
Plug 'preservim/nerdtree'                           " Explorateur de fichiers
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Recherche floue
Plug 'junegunn/fzf.vim'                             " Intégration fzf

" -- Autocomplétion et LSP --
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }

" -- Navigation du code --
Plug 'preservim/tagbar'                " Navigateur de symboles (remplace TagList)
Plug 'ludovicchabant/vim-gutentags'    " Génération automatique des tags

" -- Git --
Plug 'tpope/vim-fugitive'              " Commandes Git intégrées
Plug 'airblade/vim-gitgutter'          " Affiche les diff dans la marge

" -- Édition --
Plug 'tpope/vim-commentary'            " Commenter: gcc, gc
Plug 'tpope/vim-surround'              " Modifier délimiteurs: cs"', ds", ysiw"
Plug 'jiangmiao/auto-pairs'            " Parenthèses/guillemets automatiques
Plug 'godlygeek/tabular'               " Alignement de texte

" -- C/C++ --
Plug 'vim-scripts/a.vim'               " Basculer entre .c et .h

" -- Python --
Plug 'vim-python/python-syntax'        " Meilleure coloration syntaxique
Plug 'Vimjas/vim-python-pep8-indent'   " Indentation PEP8

" -- Apparence --
Plug 'vim-airline/vim-airline'         " Barre de statut améliorée
Plug 'vim-airline/vim-airline-themes'  " Thèmes pour airline
Plug 'morhetz/gruvbox'                 " Thème gruvbox
Plug 'tomasr/molokai'                  " Thème molokai

" -- Utilitaires --
Plug 'mbbill/undotree'                 " Historique des modifications

call plug#end()

" === OPTIONS GÉNÉRALES ===
filetype plugin indent on
syntax on

set encoding=utf-8
set number                    " Numéros de ligne
set relativenumber            " Numéros relatifs (pratique pour les mouvements)
set cursorline                " Surligner la ligne courante
set showmatch                 " Montrer les parenthèses correspondantes
set mouse=a                   " Support souris complet
set clipboard=unnamedplus     " Utiliser le clipboard système
set hidden                    " Permettre les buffers cachés non sauvegardés
set updatetime=300            " Réactivité accrue (gitgutter, etc.)
set signcolumn=yes            " Colonne pour les signes (git, erreurs)
set scrolloff=8               " Garder 8 lignes visibles autour du curseur
set colorcolumn=100           " Ligne verticale à 100 caractères

" Recherche
set hlsearch                  " Surligner les résultats de recherche
set incsearch                 " Recherche incrémentale
set ignorecase                " Ignorer la casse
set smartcase                 " Sauf si majuscule utilisée

" Indentation
set expandtab                 " Espaces au lieu de tabulations
set shiftwidth=4              " Largeur d'indentation
set tabstop=4                 " Largeur des tabulations
set softtabstop=4             " Tabulation en mode insertion
set autoindent                " Auto-indentation
set smartindent               " Indentation intelligente

" Affichage des caractères spéciaux
set list
set listchars=tab:▸\ ,trail:·,extends:›,precedes:‹,nbsp:␣

" Folding (repliement de code)
set foldmethod=syntax         " Repliement basé sur la syntaxe
set foldlevelstart=99         " Tout déplié au démarrage

" Historique persistant (undo après fermeture du fichier)
set undofile
set undodir=~/.vim/undodir

" Backups et swap
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Complétion en ligne de commande
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*.obj,*.elf,*.bin,*.pyc,__pycache__

" === THÈME ===
set termguicolors             " Couleurs 24-bit (terminal moderne)
set background=light
silent! colorscheme gruvbox   " Thème par défaut (silent! évite l'erreur si non installé)

" === TOUCHE LEADER ===
let mapleader = " "           " Leader = Espace (touche la plus accessible)
let maplocalleader = ","      " Leader local = Virgule

" === RACCOURCIS - NAVIGATION FENÊTRES ===
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Redimensionner les fenêtres
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

" === RACCOURCIS - BUFFERS ===
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" === RACCOURCIS - NERDTREE ===
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>

" === RACCOURCIS - TAGBAR ===
nnoremap <leader>t :TagbarToggle<CR>

" === RACCOURCIS - FZF (RECHERCHE) ===
nnoremap <leader>p :Files<CR>
nnoremap <leader>P :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>H :History<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>T :Tags<CR>

" === RACCOURCIS - GIT (FUGITIVE) ===
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gd :Gdiffsplit<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gl :Gclog<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gP :Git pull<CR>

" === RACCOURCIS - YOUCOMPLETEME ===
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>D :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>K :YcmCompleter GetDoc<CR>
nnoremap <leader>R :YcmCompleter RefactorRename<Space>

" === RACCOURCIS - UNDOTREE ===
nnoremap <leader>u :UndotreeToggle<CR>

" === RACCOURCIS - C/C++ ===
nnoremap <leader>a :A<CR>
nnoremap <leader>av :AV<CR>
nnoremap <leader>as :AS<CR>

" === RACCOURCIS - UTILITAIRES ===
" Effacer le surlignage de recherche
nnoremap <Esc> :nohlsearch<CR>

" Sauvegarder rapidement
nnoremap <leader>w :w<CR>

" Quitter rapidement
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" Recharger la configuration
nnoremap <leader>sv :source $MYVIMRC<CR>

" Afficher la fonction courante (C)
nnoremap <leader>F :echo getline(search("^[^ \t#/]\\{2}.*[^:]\\s*$", 'bW'))<CR>

" Ouvrir un terminal
nnoremap <leader>` :terminal<CR>

" Mode insertion: jk pour revenir en mode normal
inoremap jk <Esc>

" Déplacer des lignes en mode visuel
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Garder la sélection après indentation
vnoremap < <gv
vnoremap > >gv

" Centrer après navigation
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" === CONFIGURATION DES PLUGINS ===

" -- NERDTree --
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.o$', '\.elf$', '\.bin$', '\.map$', '\.d$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 30
" Ouvrir NERDTree automatiquement au démarrage
autocmd VimEnter * NERDTree | wincmd p
" Fermer vim si NERDTree est la dernière fenêtre
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -- Tagbar --
let g:tagbar_width = 35
let g:tagbar_autofocus = 0             " Ne pas prendre le focus au démarrage
let g:tagbar_sort = 0                  " Ordre d'apparition, pas alphabétique
" Ouvrir Tagbar automatiquement au démarrage pour C/Python
autocmd VimEnter *.c,*.h,*.py TagbarOpen
autocmd FileType c,cpp,python TagbarOpen

" -- Airline --
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'gruvbox'

" -- GitGutter --
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed = '~-'

" -- YouCompleteMe --
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-Tab>', '<Up>']
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1

" -- Gutentags --
let g:gutentags_cache_dir = expand('~/.vim/tags')
let g:gutentags_project_root = ['.git', 'Makefile', 'CMakeLists.txt']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1

" -- Python syntax --
let g:python_highlight_all = 1

" -- FZF --
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" -- Auto-pairs --
let g:AutoPairsShortcutToggle = '<leader>)'

" === AUTOCOMMANDES ===

" Retourner à la dernière position d'édition
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Paramètres spécifiques par type de fichier
autocmd FileType c,cpp setlocal shiftwidth=4 tabstop=4 colorcolumn=100
autocmd FileType python setlocal shiftwidth=4 tabstop=4 colorcolumn=100
autocmd FileType make setlocal noexpandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType cmake setlocal shiftwidth=2 tabstop=2

" Retirer les espaces en fin de ligne à la sauvegarde
autocmd BufWritePre *.c,*.h,*.py,*.json,*.yaml,*.cmake :%s/\s\+$//e

" Recompiler les tags après sauvegarde d'un fichier C
autocmd BufWritePost *.c,*.h silent! !ctags -R &

" === CSCOPE ===
if has('cscope')
    set cscopetag                     " Utiliser cscope avec :tag
    set csto=0                        " Chercher d'abord dans cscope
    set cscopeverbose

    function! LoadCscope()
        let db = findfile("cscope.out", ".;")
        if (!empty(db))
            let path = strpart(db, 0, match(db, "/cscope.out$"))
            set nocscopeverbose
            exe "cs add " . db . " " . path
            set cscopeverbose
        endif
    endfunction
    autocmd BufEnter /* call LoadCscope()

    " Raccourcis cscope
    nnoremap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
endif

" === FONCTION POUR AFFICHER LA FONCTION PARENTE (C) ===
function! ShowFuncName()
    let lnum = line(".")
    let col = col(".")
    echohl ModeMsg
    echo getline(search("^[^ \t#/]\\{2}.*[^:]\\s*$", 'bW'))
    echohl None
    call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfunction

" === TERMDEBUG (Debugging intégré) ===
" Charger le plugin Termdebug (intégré à Vim)
packadd termdebug

" Utiliser gdb-multiarch pour ARM
let g:termdebugger = 'gdb-multiarch'

" Layout: vertical (source | gdb | variables)
let g:termdebug_wide = 1

" Raccourcis debug
nnoremap <leader>dd :Termdebug<CR>
nnoremap <leader>db :Break<CR>
nnoremap <leader>dB :Clear<CR>
nnoremap <leader>dc :Continue<CR>
nnoremap <leader>dn :Over<CR>
nnoremap <leader>ds :Step<CR>
nnoremap <leader>df :Finish<CR>
nnoremap <leader>dr :Run<CR>
nnoremap <leader>dS :Stop<CR>
nnoremap <leader>de :Evaluate<CR>
vnoremap <leader>de :Evaluate<CR>

" Fonction pour démarrer le debug STM32
function! DebugSTM32()
    " Ouvre Termdebug avec le fichier ELF
    let l:elf = 'build/envision_cm7/apps/envision_cm7/envision_cm7.elf'
    if filereadable(l:elf)
        execute 'Termdebug ' . l:elf
        " Attendre que GDB soit prêt puis connecter à OpenOCD
        sleep 500m
        call TermDebugSendCommand('target extended-remote :3333')
        call TermDebugSendCommand('monitor reset halt')
        call TermDebugSendCommand('load')
    else
        echo "ELF not found: " . l:elf
        echo "Build first with: ./host/bin/build.sh -p envision_cm7 -t ev_board_cm7 -d"
    endif
endfunction

nnoremap <leader>dD :call DebugSTM32()<CR>

" === FIN DE LA CONFIGURATION ===
