set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Plugin ctags
Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-fugitive'

" " Plugin easy tags ctags generation
" " Plugin 'xolox/vim-misc'
" " Plugin 'xolox/vim-easytags'

" " Plugin Nerd Commenter
Plugin 'scrooloose/nerdcommenter'

" " Nerd tree
Plugin 'scrooloose/nerdtree'

" " Plugin airline
Plugin 'bling/vim-airline'

Plugin 'godlygeek/tabular'

Plugin 'jeetsukumaran/vim-buffergator'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'jremmen/vim-ripgrep'

Plugin 'vim-python/python-syntax'

Plugin 'nvie/vim-flake8'

Plugin 'drmingdrmer/vim-toggle-quickfix'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'psf/black'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'

Plugin 'stefandtw/quickfix-reflector.vim'

Plugin 'junegunn/goyo.vim'

Plugin 'junegunn/limelight.vim'

Plugin 'kenn7/vim-arsync'

" All of your Plugins must be added before the following line
call vundle#end()            " required

call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]

let g:python_highlight_all = 1

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set nocompatible              " be iMproved, required

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup      " do not keep a backup file, use versions instead
else
    set backup        " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent        " always set autoindenting on

endif " has("autocmd")

set autoindent

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" My shit is after this line

autocmd CompleteDone * pclose


let g:buffergator_suppress_keymaps = 1

" Leader bindings
let mapleader=","
map <Leader>w :w<CR>
map <Leader>c ^i//<esc>
map <Leader>uc ^df/^df/
map <Leader>b ^
map <Leader>e $
map <Leader>da :%d<CR>
map <Leader>h :nohl<CR>
map <Leader>q :q<CR>
map <Leader>s :sh<CR>
map <Leader>m :BuffergatorToggle<CR>
map <leader>a ggvG
map <leader>y "+y
map <leader>Y "+Y
map <leader>p "+p
map <leader>P "+P
map <leader>t :TagbarOpenAutoClose<CR>
map <leader>d :bd<CR>
map <leader>v :vsplit<CR>
map <leader>. :NERDTreeToggle<CR>
map <leader>g :Utl<CR>
map <leader><leader> <C-W><C-W>

set regexpengine=1

"map <leader>s :!clear && rsync -v /Users/vladsobol/study/NYU/research/PPUU/sppuu/Notebooks/Visualization/*.*py* cassio:~/work/pytorch-PPUU_2/Notebooks/Visualization<CR>
"map <leader>s :!clear && rsync -v /Users/vladsobol/study/NYU/research/PPUU/sppuu/*.py cassio:~/work/pytorch-PPUU/ && rsync -v /Users/vladsobol/study/NYU/research/PPUU/sppuu/scripts/* cassio:~/work/pytorch-PPUU/scripts;<CR>
"map <leader>s :!clear && rsync -zarv --include="*/" --include="*.csv" --include="*.py" --include="*.json" --include="*.sh" --include="*.slurm" --exclude="*" /Users/vladsobol/work/research/PPUU/repo/. cassio:~/work/pytorch-PPUU/.; <CR>
"map <leader>s :!clear && rsync -zarv --include="*/" --include="*.csv" --include="*.py" --include="*.json" --include="*.sh" --include="*.slurm" --exclude="*" /Users/vladsobol/work/research/PPUU/repo/. cassio:~/work/pytorch-PPUU_2/.; <CR>
"map <leader>s :!clear && rsync -zarv --include="*/" --include="*.ipynb" --include="*.py" --include="*.json" --include="*.sh" --include="*.slurm" --exclude="*" /Users/vladsobol/work/research/PPUU/repo/. cassio:~/work/pytorch-PPUU_offroad/.;<CR>
"map <leader>s :!clear && rsync -zarv --progress --include="*/" --include="*.ipynb" --include="*.py" --include="*.json" --include="*.sh" --include="*.slurm" --exclude="*" /Users/vladsobol/work/research/PPUU/repo/.  cassio:~/work/pytorch-PPUU_dreaming/.;<CR>
"map <leader>s :!clear && rsync -zarv --progress --include="*/" --include="*.ipynb" --include="*.py" --include="*.json" --include="*.sh" --include="*.slurm" --exclude="*" /Users/vladsobol/work/research/PPUU/repo/.  cassio:~/work/pytorch-PPUU_render/.;<CR>

let g:black_linelength=120
map <leader>s :!clear && source ./sync.sh<CR>

map <space>f :CtrlP<CR>
map <leader>f :Rg
map <space>t :Black<CR> 

map <space>p :call flake8#Flake8()<CR>
map <space>4 :cn<CR>
map <space>3 :cp<CR>

map <space>q :ccl<CR>
map <space>o :copen<CR>
map <space>g :Goyo<CR>

let g:flake8_show_in_gutter = 1

" key bindings
inoremap <F9> <Esc><F9>
inoremap <F8> <Esc><F8>
map <F3> <esc>:w<CR>:bp<CR>
map <F4> <esc>:w<CR>:bn<CR>
map <leader>3 <esc>:w<CR>:bp<CR>
map <leader>4 <esc>:w<CR>:bn<CR>

" visuals
colorscheme pettir
set number
set cursorline
set background=light
set termguicolors

" donno why I need these
set nocompatible
filetype on
filetype plugin on

" snipMate rebind tab
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_theme = 'one'
let g:airline_left_sep = '>'
let g:airline_left_alt_setp = '|'
let g:airline_right_sep = '<'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '/'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_symbols.readonly = 'r'
set laststatus=2
set ttimeoutlen=50

" undo
" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
"Gundo trigger
nnoremap <leader>u :GundoToggle<CR>

" backup dirs, must be created to work
set backupdir=~/.vim/tmp
set dir=~/.vim/swap

" tags
set tags=./tags;

" folds
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" reload and open vimrc
nnoremap <leader>rrc :source $MYVIMRC<CR>
nnoremap <leader>orc :vsp $MYVIMRC<CR>

nnoremap <F10> :make! run<CR>
nnoremap <F11> :make! all<CR>

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" " YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_key_invoke_completion = '<C-b>'
map <leader>x :YcmCompleter FixIt<CR>

" " date
:nnoremap <F5> "=strftime("%d/%m/%y")<CR>P
:inoremap <F5> <C-R>=strftime("%d/%m/%y")<CR>

" " formatter
let g:formatter_yapf_style = 'chromium'

" " Nerd Tree
let NERDTreeQuitOnOpen = 1

" " Lusty
set hidden

" compiling files
autocmd FileType cpp nnoremap <F9> :w<CR>:!clear<CR>:!rm "%:p:r" -f; g++ -O2 -Wall -Wextra -std=c++14 -DDEBUG -o "%:p:r" "%:p"<CR>
autocmd FileType cpp nnoremap <leader><F9> :w<CR>:!clear<CR>:!clang -Wall -Wextra -pthread -std=c++14 -O3 -lstdc++ "%:p" -o "%:p:r"<CR>
autocmd FileType cpp nnoremap <F8> :!clear<CR>:!"%:p:r"<CR>
autocmd FileType cs nnoremap <F9> :w<CR>:!mcs "%:p:r".cs<CR>
autocmd FileType cs nnoremap <F8> :!mono "%:p:r".exe<CR>
autocmd FileType c nnoremap <F9> :w<CR>:!gcc "%:p:r".c -Wall -pedantic -std=c99 -o "%:p:r"<CR>
autocmd FileType c nnoremap <F8> :!clear<CR>:!"%:p:r"<CR>
autocmd FileType java nnoremap <F9> :w<CR>:!clear<CR>:!rm "%:p:r".class -f && javac "%:p"<CR>
autocmd FileType java nnoremap <F8> :!java "%:r"<CR>
autocmd FileType ocaml nnoremap <F9> :w<CR>:!ocamlc -o "%:p:r" "%:p:r".ml<CR>
autocmd FileType ocaml nnoremap <F8> :!"%:p:r"<CR>
autocmd FileType python nnoremap <leader>r :w<CR>:!python3 "%:p"<CR>
autocmd FileType sh nnoremap <leader>r :w<CR>:!"%:p"<CR>
autocmd FileType tex nnoremap <F9> :w<CR>:!xelatex "%:p" && zathura "%:p:r".pdf<CR>
autocmd FileType markdown nnoremap <F9> :w<CR>:!~/.scripts/md_viewer.py "%"<CR>
autocmd FileType javascript nnoremap <F9> :w<CR>:!node "%"<CR>
autocmd FileType javascript nnoremap <F8> :w<CR>:!eslint "%"<CR>
autocmd FileType matlab nnoremap <leader>r :w<CR>:!octave "%"<CR>


autocmd FileType haskell nnoremap <leader>; :w<CR>:!ghc -o "%:p:r" "%"<CR>
autocmd FileType haskell nnoremap <leader>r :!clear<CR>:!"%:p:r"<CR>

func! TimerFunc(timer)
    call feedkeys("\<C-A>")
endfunc

imap jj <Esc>
