# my rc files

those are the files from my ~/local/etc i can share with you. ask me for other stuff (mutt, mbsync, ...)

just symlink to install most files.

```
ln -s $PWD/zsh/zshenv ~/.zshenv 
ln -s $PWD/zsh/zshrc ~/.zshrc 
ln -s $PWD/haskeline ~/.haskeline
# and so on ...
```

vim is particular as it uses vundle:

```
cd vim
ln -s $PWD/_vimrc ~/.vimrc
ln -s $PWD/vimfiles ~/.vim
cd !$
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
```



