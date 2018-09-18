Clint's minimal dotfiles
This dotfiles works for Linux and OS X.

Prerequisites:

- Python and pyyaml
- VIM (make sure to install vim-gui-common and vim-runtime)
- Vundle (package manager for VIM)
- Bash

Original skeleton copied from sontek/dotfiles.



### Installation

0. Make sure the prerequisites are installed

1. git clone the package

        $ git clone https://github.com/ckyang74/dotfiles.git


   This will create a local directory called dotfiles.

2. cd into the dotfiles directory, then run the installer:

        $ ./installer.py

3. Make sure Vundle is installed (see below)
4. Update `~/.bash_aliases` for machine specific bash settings
5. Update `~/.vimrc.local` for machine specific VIM settings



### Vundle

The vim package manager is Vundle. Install Vundle with

    $ git clone https://github.com/VundleVim/Vundle.vim.git \
      ~/.vim/bundle/Vundle.vim

Then from within VIM, run:

    :PluginInstall

