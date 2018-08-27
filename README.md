Clint's minimal dotfiles

Requirements:

- Python, and pyyaml
- VIM, including vim-gui-common, vim-runtime, and Vundle
- Bash

Original skeleton copied from sontek/dotfiles.



### Installation

1. git clone the package

        $ git clone https://github.com/ckyang74/dotfiles.git


   This will create a local directory called dotfiles.

2. cd into the dotfiles directory, then run the installer:

        $ ./installer.py

3. Download/install Vundle (see below)
4. Update `~/.bash_aliases` for machine specific bash settings
5. Update `~/.vimrc.local` for machine specific VIM settings
6. Update `~/.config/dev_config.yaml` for other machine specific settings



### Vundle

The vim package manager is Vundle. Install Vundle with

    $ git clone https://github.com/VundleVim/Vundle.vim.git \
    ~/.vim/bundle/Vundle.vim

Then from within VIM, run:

    :PluginInstall



### fzf

Install fzf:

    $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

    $ ~/.fzf/install


2014.1122
