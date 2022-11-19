# History

export HISTSIZE=50000000;             # almost infinite history 
export HISTFILESIZE=$HISTSIZE;        # "
export SAVEHIST=$HISTSIZE             # "
export HIST_STAMPS="yyyy-mm-dd"       # history entry format
export HISTFILE="$HOME/.zsh_history"  # history location
setopt hist_ignore_all_dups           # ignore duplicates
setopt hist_ignore_space              # ignore whitespace
setopt inc_append_history             # append history incrementally
setopt share_history                  # share history across sessions

# Functions

t() { 
  # Improved shorthand for `tree` (source @jessfraz/dotfiled)
  tree -aC -I '.git' --dirsfirst "$@" | less -FRNX 
}

ban_host() {
  # Pastes a domain from the clipboard into /etc/hosts (mac only)
  sudo -- sh -c "echo '127.0.0.1       $(pbpaste)' >> /etc/hosts"
}

# Aliases

alias ll="ls -laGh"
alias t2='t -L 2'
alias t3='t -L 3'
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias gl='git log --all --decorate --oneline --graph'
alias gs='git status'

if [ -f private.sh ]; then source private.sh; fi

# Completion

autoload -Uz compinit && compinit     # advanced tab completion
autoload bashcompinit && bashcompinit # advanced tab completion

zmodload -i zsh/complist # extensions to completion listing
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol     # unset zsh keyboard flow control in autocomplete
setopt auto_menu         # show completion menu on successive tab press
setopt complete_in_word 
setopt always_to_end

zstyle ':completion:*:*:*:*:*' menu select  # arrow-key autocomplete 
zstyle ':completion:*' rehash true          # automatically update PATH entries
zstyle ':completion:*' list-colors ''       # show colors in dir output
zstyle ':completion:*' list-dirs-first true # directories and files separated 
zstyle ':completion:*' list-prompt ''       # scroll if it doesn't fit
zstyle ':completion:*' select-prompt ''     # scroll if it doesn't fit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' #  matches case insensitive

# Prompt

autoload -Uz vcs_info                       # adds git branch to prompt
precmd_vcs_info() { vcs_info }              # "
precmd_functions+=( precmd_vcs_info )       # "
precmd() { vcs_info }                       # "
zstyle ':vcs_info:git:*' formats '(%b) '    # "
setopt PROMPT_SUBST                         # set our own prompt
PROMPT='%F{37}%2~%f %F{34}${vcs_info_msg_0_}%f%B%F{178}%#%b%f '

# Packages

# Check if z is installed
# https://github.com/agkozak/zsh-z

if [ -d ~/.zsh/zsh.z ]
  then
    source ~/.zsh/zsh.z/zsh-z.plugin.zsh
fi

# Check if zsh-autosuggestions is installed
# https://github.com/zsh-users/zsh-autosuggestions

if [ -d ~/.zsh/zsh-autosuggestions ]
  then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
