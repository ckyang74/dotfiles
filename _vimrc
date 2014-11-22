" ==========================================================
" Vundle
" ==========================================================

set nocompatible              " required VIM default setting
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" First of all, we must manage the vundle package itself with vundle
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

Plugin 'scrooloose/nerdtree.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" To provide code snippet templates
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Solarized colorscheme
" http://ethanschoonover.com/solarized
Plugin 'Solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Now we can turn our filetype functionality back on
filetype plugin indent on    " file type detection, load custom filetype plugin files
                             " and indentation based on filetype

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==========================================================
" Plugin: UltiSnips
" ==========================================================

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==========================================================
" Others
" ==========================================================

set nocompatible              " required VIM default setting
set ruler
filetype plugin indent on     " file type detection, load custom filetype plugin files
                              " and indentation based on filetype

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmode=full             " <Tab> cycles between all matching choices.
set noic                      " Case sensitive search
set sm                        " Show matching ()'s []'s {}'s
set hlsearch                  " Highlight search results
set pastetoggle=<C-a>         " use quick key to toggle paste/nopaste
set textwidth=100

""" colors see colorscheme files under ~/.vim/colors/
set t_Co=256                  " xterm 256 color
syntax enable                 " syntax highlighting enabled, needed for the
                              " colorschemes to work
set background=dark
"colorscheme distinguished
"colorscheme grb256
"colorscheme codeschool
"colorscheme vividchalk
colorscheme solarized

" Indentations
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=4
set expandtab

" Ignore files with specified pattern.
set wildignore+=*.pyc,*.o,*.class,.git,blaze-bin,blaze-out,blaze-google3,blaze-testlogs,blaze-genfiles
set wildmenu    " auto-completion for file names. E.g., :e <Tab>

" Honor .bashrc
" http://stackoverflow.com/questions/8841116/vim-not-recognizing-aliases-when-in-interactive-mode
set shell=/bin/bash\ --rcfile\ ~/.bashrc

" Recognize .md as markdown file
au BufNewFile,BufRead *.md setf markdown

" Remove trailing spaces for specified file types
autocmd FileType md,yaml,yml autocmd BufWritePre <buffer> :%s/\s\+$//e

let mapleader = ","
