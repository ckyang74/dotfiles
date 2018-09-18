" ========
" HTML/CSS
" ========

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" jinja2 as HTML
autocmd BufNewFile,BufRead *.jinja2 setlocal setfiletype=html

" No tabs, 2 spaces for indentation
autocmd FileType html,css
    \ setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" automatically replace tabs with 2 spaces when file is opened
autocmd FileType html,css :%s/\t/  /ge

" Remove trailing spaces right before save
autocmd BufWritePre <buffer> autocmd FileType html,css :%s/\s\+$//e

" Show line breaks and tabs as special characters
autocmd FileType html,css setlocal list



" ==========================================================
" Vundle (plugin installer)
" ==========================================================

set nocompatible              " required VIM default setting
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end
call vundle#begin()

" This has to go first
Plugin 'gmarik/Vundle.vim'

" For Git support
" Eg, :Gstatus for git status
Plugin 'tpope/vim-fugitive'

" For auto completion
Plugin 'git://git.wincent.com/command-t.git'

" For directory tree UI. Usage:
" :NERDTree
Plugin 'scrooloose/nerdtree.git'

" Syntax checker (for Python now, can support other languages)
Plugin 'scrooloose/syntastic.git'

" 2016/10/21 - commented out since it interfers with ^n
"
" HTML code snippet
" Eg, type div, then ^e, it expands to <div></div>
" The sparkup vim script is in a subdirectory:
"
"     ~/.vim/bundle/sparkup/vim/.
"
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" To provide code snippet templates
Plugin 'SirVer/ultisnips'

Plugin 'leafgarland/typescript-vim'

" Snippets are separated from the engine. Add this if you want them:
" Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Now we can turn our filetype functionality back on
filetype plugin indent on

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

let mapleader = ","           " Set comma as <leader>
let maplocalleader = "\\"     " Set \ as <localleader>

syntax on                     " Syntax highlighting enabled
set nocompatible              " Required VIM default setting
set nostartofline             " Avoid moving cursor to BOL when jumping around
set scrolloff=3               " Keep 3 context lines above and below the cursor
filetype plugin indent on     " File type detection, load custom filetype plugin files
set noautowrite               " Never write a file unless I request it.
set noautowriteall            " NEVER.

set number                    " Display line numbers
set numberwidth=1             " Use only 1 column (and 1 space) while possible
set title                     " Show title in console title bar
set noic                      " Case sensitive search
set sm                        " Show matching ()'s []'s {}'s
set hlsearch                  " Highlight search results
set pastetoggle=<C-a>         " Use quick key to toggle paste/nopaste
set cursorline                " Have a line indicate the cursor location
set nowrap                    " Don't wrap text
set linebreak                 " Don't wrap textin the middle of a word
set textwidth=80              " Line width at 80 chars.
set colorcolumn=+1
set ffs=unix,dos,mac          " Try recognizing dos, unix, and mac line endings.
set tags=./tags;/             " Recognize ctags files in cwd and in root


" UTF8 handling
if has("multi_byte")
  set enc=utf-8
  set fenc=utf-8
  set termencoding=utf-8
  set fileencodings=utf-8,ucs-bom,big5,latin1
endif

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


"""" Messages, Info, Status
set ruler                     " Show the cursor position all the time
set ls=2                      " Allways show status line
set showcmd                   " Show incomplete normal mode commands as I type.
set report=0                  " : commands always print changed line count.
set shortmess+=a              " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2              " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}


"""" Colors
"""" See colorscheme files under ~/.vim/colors/
set t_Co=256                  " xterm 256 color
set background=dark
"colorscheme distinguished
"colorscheme grb256
"colorscheme codeschool
"colorscheme vividchalk
colorscheme torte
" Better comment color
" http://unix.stackexchange.com/questions/88879/vim-better-colors-so-comments-arent-dark-blue
color desert


"""" Sound
set noerrorbells
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.


"""" Indentations
set autoindent              " Always set autoindenting on
set tabstop=2               " <tab> inserts 2 spaces
set shiftwidth=2            " But an indent level is 2 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " Rounds indent to a multiple of shiftwidth


"""" Ignore files with specified pattern.
set wildmenu                  " Auto-completion for file names. E.g., :e <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*.class,.git,*.js.map



" ==========================
" FileType specific settings
" ==========================

" TODO(2018/9/18) yaml, yml, json, md, sh, proto, txt

" No tabs, 2 spaces for indentation
" (Note: mkd is for markdown)
autocmd FileType yaml,xhtml,xml,mkd
    \ setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Remove trailing spaces right before save
autocmd BufWritePre <buffer> autocmd FileType 
    \ mkd,text,yaml :%s/\s\+$//e




" ========
" Java
" ========

" No tabs, 2 spaces for indentation
autocmd FileType java
    \ setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Add '// ' before a line with <localleader>c
autocmd FileType java nnoremap <buffer> <localleader>c I// <esc>

" automatically replace tabs with 2 spaces when file is opened
autocmd FileType java :%s/\t/  /ge

" Remove trailing spaces right before save
autocmd BufWritePre <buffer> autocmd FileType java :%s/\s\+$//e

" Show line breaks and tabs as special characters
autocmd FileType java setlocal list




" ======
" Python
" ======

autocmd FileType python set omnifunc=pythoncomplete#Complete

" No tabs, 2 spaces for indentation
autocmd FileType python setlocal
    \ expandtab shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType python setlocal
    \ cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"autocmd BufRead python compiler nose

autocmd BufRead python
    \ set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Add '# ' before a line with <localleader>c
autocmd FileType python nnoremap <buffer> <localleader>c I# <esc>

" automatically replace tabs with 2 spaces when file is opened
autocmd FileType python :%s/\t/  /ge

" Remove trailing spaces right before save
autocmd BufWritePre <buffer> autocmd FileType python :%s/\s\+$//e

" Show line breaks and tabs as special characters
autocmd FileType python setlocal list

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0



" =====================
" javascript/typescript
" =====================

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" No tabs, 2 spaces for indentation
autocmd FileType javascript,typescript
    \ setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Add '// ' before a line with <localleader>c
autocmd FileType javascript,typescript nnoremap <buffer> <localleader>c I// <esc>

" automatically replace tabs with 2 spaces when file is opened
autocmd FileType javascript,typescript :%s/\t/  /ge

" Remove trailing spaces right before save
autocmd BufWritePre <buffer> autocmd FileType javascript,typescript :%s/\s\+$//e

" Show line breaks and tabs as special characters for javascript
autocmd FileType javascript,typescript setlocal list



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
" Plugin: Syntastic
" ==========================================================

" For python, use flake8 checker instead of default (pylint)
let g:syntastic_python_checkers = ['flake8']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_flake8_args='--ignore=E501,E111,E114'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


" ==========================================================
" Extra (machine specific) settings
" ==========================================================

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" for fzf
set rtp+=/Users/clintyang/homebrew/opt/fzf
