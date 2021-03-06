#!/bin/bash

#check git command
if type git; then
    : # no problem
else
    echo "Please install git to preceed"
    exit 1;
fi

CONFIGS_REPO_DIR=$HOME/configs

#if [ -e $CONFIGS_REPO_DIR ]; then
#    echo "config dir $CONFIGS_REPO_DIR already exists"
#    exit 1;
#fi

echo "fetching config repo"
mkdir -p $CONFIGS_REPO_DIR
git clone https://github.com/grzebiel/configs.git $CONFIGS_REPO_DIR

function symlinkFile
{
    if [[ -f ~/.$1 ]]; then
        echo "~/.$1 file found, moving it to ~/$1.old";
        mv ~/.$1 ~/$1.old;
    fi
    echo "symlinking $CONFIGS_REPO_DIR/bashrc to ~/.bashrc"
    ln -s $CONFIGS_REPO_DIR/$1 ~/.$1
}

configFiles=( "bashrc" "vimrc" "adc_func.sh" "bash_aliases")

for file in "${configFiles[@]}"
do
    symlinkFile "$file"
done

echo "creating ~/.vim/.cache dir needed by some plugins"
mkdir -p ~/.vim/.cache

echo "~~~~~ POST INSTALL ~~~~~"
echo "Vim airline:"
echo "\tfor vim-airline fonts go to: https://github.com/bling/vim-airline"
echo "\tin case of Mac OS X change terminal font for one of installed"
echo "\tfor iterm2 there is 2 different fonts for ASCII and NON_ASCII"
command! FZFMru call fzf#run({ 'source': v:oldfiles, 'sink' : 'e ', 'options' : '-m', })
