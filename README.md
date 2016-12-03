
# configs

## files locations
```sh
ln -s vimrc ~/.vimrc
ln -s bashrc ~/.bashrc
ln -s i3config ~/.config/i3/config # optionaly ~/.i3/config
ln -s bash_aliases ~/.bash_aliases
ln -s adc_func ~/.adc_func.sh
ln -s tmux.conf ~/.tmux.conf
ln -s bash_completion ~/.bash_completion
ln -s Xresources ~/.Xresources
```

## vim package manager
requires [ Shougo/dein.vim][1] installed in
```
~/.vim/bundle
```

## fonts
URXVT fonts: adobe-source-code-pro-fonts
I3: DejaVu
symbols: font-awesome

## URXVT
extensions to instal: urxct-font-size-git

## i3 open term from here
dependencies:
```
xorg-xdpyinfo
```

## Fzf
requires [junegunn/fzf][2] installed


## viconf
asumes that its checkout to `~/config` dir

### bash completion
`.bash_completion` supports tab completions, install [scop/bash_completion][3] to use it

## fortune
For random quote at bash startup install fortune


[1]:https://github.com/junegunn/fzf
[2]:https://github.com/Shougo/dein.vim
[3]:https://github.com/scop/bash_completion
