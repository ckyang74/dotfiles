" ==========================================================
" Vundle (install it first from github)
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
" Others
" ==========================================================

set nocompatible              " required VIM default setting
let mapleader = ","           " Set comma as <leader>
set nostartofline             " Avoid moving cursor to BOL when jumping around
set scrolloff=3               " Keep 3 context lines above and below the cursor
filetype plugin indent on     " file type detection, load custom filetype plugin files
                              " and indentation based on filetype
set noautowrite               " Never write a file unless I request it.
set noautowriteall            " NEVER.

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set noic                      " Case sensitive search
set sm                        " Show matching ()'s []'s {}'s
set hlsearch                  " Highlight search results
set pastetoggle=<C-a>         " use quick key to toggle paste/nopaste
set cursorline                " have a line indicate the cursor location
set textwidth=100             " line width at 100 chars.
set nowrap                    " don't wrap text
set linebreak                 " don't wrap textin the middle of a word
set colorcolumn=79
set ffs=unix,dos,mac          " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ruler                     " show the cursor position all the time
set ls=2                      " allways show status line
set showcmd                   " Show incomplete normal mode commands as I type.
set report=0                  " : commands always print changed line count.
set shortmess+=a              " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2              " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

"""" Colors
"""" See colorscheme files under ~/.vim/colors/
set t_Co=256                  " xterm 256 color
syntax enable                 " syntax highlighting enabled, needed for the
                              " colorschemes to work
set background=dark
"colorscheme distinguished
"colorscheme grb256
"colorscheme codeschool
"colorscheme vividchalk
"colorscheme solarized
colorscheme torte
" Better comment color
" http://unix.stackexchange.com/questions/88879/vim-better-colors-so-comments-arent-dark-blue
color desert

"""" Sound
set noerrorbells
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.

"""" Indentations
set autoindent              " always set autoindenting on
set tabstop=2               " <tab> inserts 4 spaces 
set shiftwidth=2            " but an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " Rounds indent to a multiple of shiftwidth

"""" Ignore files with specified pattern.
set wildmenu                  " Auto-completion for file names. E.g., :e <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,.git

"""" Others
" Honor aliases from .bashrc
" http://stackoverflow.com/questions/8841116/vim-not-recognizing-aliases-when-in-interactive-mode
set shell=/bin/bash\ --rcfile\ ~/.bashrc

"command! Q :qall              " Type uppercase Q to quit all files (exit vim)

" Save file
map <leader>w :w<CR>

" Paste from clipboard
map <leader>p "+p

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" ==========================================================
" FileType specific changes
" ==========================================================

" jinja2 as HTML
autocmd BufNewFile,BufRead *.jinja2 setlocal ft=html

autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Recognize .md as markdown file
au BufNewFile,BufRead *.md setf markdown

" Remove trailing spaces for specified file types
autocmd FileType python,markdown,text,yaml, autocmd BufWritePre <buffer> :%s/\s\+$//e

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=2 tabstop=4 softtabstop=2 cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" ==========================================================
" Plugin: UltiSnips
" ==========================================================

" Trigger configuration
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ==========================================================
" Plugin: command-t
" ==========================================================

" file search
map <leader>f :CommandT<CR>
" Ack searching
nmap <leader>a <Esc>:Ack!


" ==========================================================
" Extra (machine specific) settings
" ==========================================================

if filereadable(glob("~/.vimrc.local")) 
  source ~/.vimrc.local
endif

