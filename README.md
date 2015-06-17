# my rc files

those are some files of my daily setup. lovely home made since the last millenium.

the way i use this repo is

* clone it into `~/local/etc`
* install symlinks in the right files, like 

    ln -s $PWD/zsh/zshenv ~/.zshenv 
    ln -s $PWD/zsh/zshrc ~/.zshrc 
    ln -s $PWD/haskeline ~/.haskeline
    # and so on ...

from time to time, move some files in separated repos as i want to share them 
using [vim pathogen](https://github.com/tpope/vim-pathogen)
or [zsh uze](https://github.com/eiro/uze).

# Notes

## irssi

some scripts are outdated raw copies: 

* `cap_sasl.pl` from [irssi scripts directory](http://scripts.irssi.org/)
* `vim_mode.pl` from [irssi vim  mode git repo](https://github.com/shabble/irssi-scripts/tree/master/vim-mode)

It would be nice to have an `IrssiX::` namespace on [CPAN](http://metacpan.org)
to add some suggar on top of the `Irssi::` low level API.
