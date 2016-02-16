setopt autopushd    # so cd <tab> will be magic

# '^[' or \e is escape key
# \ea is used to avoid recursive mappings

# vi mode
bindkey -v

# make zsh work like vim's
# https://github.com/eiro/rcfiles/blob/master/vim/vimfiles/plugin/parentheses.vim

bindkey -s '((' '()\ei'
bindkey -s '( (' '(   )\ehhi'
bindkey -s '(((' '(\ea(   ))\ehhhi'
bindkey -s '{{' '{}\ei'
bindkey -s '{ {' '{  }\ehi'
bindkey -s '{{{' '{\ea{   }}\ehhhi'
bindkey -s '[[' '[]\ei'
bindkey -s '[ [' '[   ]\ehhi'
bindkey -s '[[[' '[\ea[   ]]\ehhhi'
bindkey -s '[-' '[\ea[ -  ]]\ehhhi'
bindkey -s "''" "'\ea'\ei"
bindkey -s '""' '"\ea"\ei'
bindkey -s '(f' 'for it ()\ei'
bindkey -s '{w' 'while {} {}\e4ha'

# get lost ? RTFM!
autoload run-help

# edit commandline with your favorite ($FCEDIT)or
autoload edit-command-line
zle -N edit-command-line

# thune the vi normal mode {{{
#
# named vicmd in zle. bindkey -a to deal with it

# remember: 
# don't try to look like the readline because zle is richer:
# steal from vim instead

bindkey -a -r :
bindkey -a q: execute-named-cmd
bindkey -a :e edit-command-line
bindkey -a :h run-help

# }}}

# emacs well known quick-wins
bindkey '^A' beginning-of-line # also: learn ^ and I from vi
bindkey '^E' end-of-line       # also: learn $ and A from vi

bindkey '^R' history-incremental-search-backward
# also learn from !? event and history|vim -


compdef _gnu_generic ctags
compdef _gnu_generic zenity
compdef _gnu_generic source-highlight
compdef 'compadd ~/.mutt/accounts/*(:r:t)' box

autoload -U zed 

# following http://www.linux-mag.com/id/1106/ tutorial
# found with (http://www.bash2zsh.com/)

zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose yes
zstyle ':completion:*:warnings' format 'No matches for: %d'
