setopt autopushd    # so cd <tab> will be magic

zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# '^[' or \e is escape key
# \ea is used to avoid recursive mappings

# vi mode
bindkey -v

# khatar's vi mapping
# bindkey -s '((' '()\ei'
# bindkey -s '( (' '(   )\ehhi'
# bindkey -s '(((' '(\ea(   ))\ehhhi'
# bindkey -s '{{' '{}\ei'
# bindkey -s '{ {' '{  }\ehi'
# bindkey -s '{{{' '{\ea{   }}\ehhhi'
# bindkey -s '[[' '[]\ei'
# bindkey -s '[ [' '[   ]\ehhi'
# bindkey -s '[[[' '[\ea[   ]]\ehhhi'
# bindkey -s '[-' '[\ea[ -  ]]\ehhhi'
# bindkey -s "''" "'\ea'\ei"
# bindkey -s '""' '"\ea"\ei'
# bindkey -s '(F' 'for x ()\ei'
# bindkey -s '{w' 'while {} {}\e4ha'

# khatar's vi mapping
bindkey -s '(' '^v()\ei'
bindkey -s '{' '^v{}\ei'
bindkey -s '[' '^v[]\ei'
bindkey -s "'" "^v'^v'\ei"
bindkey -s '"' '^v"^v"\ei'
bindkey -s '(F' 'for x ('
bindkey -s '{w' 'while ^v{} ^v{}\e4ha'
 
# get lost ? RTFM!
autoload run-help
bindkey -a '\eh' run-help

# edit commandline with your favorite ($FCEDIT)or
autoload edit-command-line
zle -N edit-command-line
bindkey -a '\ev' edit-command-line
bindkey -a '\ec' _complete_help
bindkey '^R' history-incremental-search-backward

compdef _gnu_generic ctags
compdef _gnu_generic zenity
compdef _gnu_generic source-highlight
compdef 'compadd ~/.mutt/accounts/*(:r:t)' box

autoload -U zed 

# following http://www.linux-mag.com/id/1106/ tutorial
# found with (http://www.bash2zsh.com/)
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

