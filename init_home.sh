# /usr/bin/bash

LIST=".zshrc .ctags .gitconfig .tmux.conf .vimrc"

for i in $LIST; do
    ln -f ./$i ~/$i
done
