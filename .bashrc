# Return immediately for non-interactive shells
[[ $- != *i* ]] && return

# Ultra minimal prompt with gruvbox colors
PS1='\[\e[1;38;5;142m\]\u\[\e[0m\] \[\e[1;38;5;167m\]>\[\e[0m\] \[\e[1;38;5;109m\][\[\e[0m\]\[\e[1;38;5;109m\]\w\[\e[0m\]\[\e[1;38;5;109m\]]\[\e[0m\] \[\e[1;38;5;214m\]$\[\e[0m\] '

# Setup basic aliases (evaluated lazily)
alias ..='cd ..'
alias copy='xclip -selection clipboard'
extract() {
  [[ -f "$1" ]] || { echo "'$1' is not a valid file"; return 1; }
  case "$1" in
    *.tar.bz2) tar xjf "$1" ;;
    *.tar.gz)  tar xzf "$1" ;;
    *.bz2)     bunzip2 "$1" ;;
    *.rar)     unrar e "$1" ;;
    *.gz)      gunzip "$1"  ;;
    *.tar)     tar xf "$1"  ;;
    *.tbz2)    tar xjf "$1" ;;
    *.tgz)     tar xzf "$1" ;;
    *.zip)     unzip "$1"   ;;
    *.Z)       uncompress "$1" ;;
    *.7z)      7z x "$1"    ;;
    *)         echo "'$1' cannot be extracted via extract()" ;;
  esac
}

# Configure colors for ls and completion
eval "$(dircolors -b)"
# Minimal gruvbox colors - only folders and shell scripts
export LS_COLORS="fi=0:di=1;38;5;109:ln=1;38;5;109:ex=0"
# Only highlight shell scripts
export LS_COLORS="$LS_COLORS:\
*.sh=1;38;5;142"

# Add color support for ls and grep
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias sqlserver='docker start 6fb40a7fd91f'
alias sync='sudo cp -r final-project/ -t /opt/lampp/htdocs/';

# Enhanced tab completion settings
bind "set show-all-if-ambiguous on"
bind "set colored-stats on"
bind "set visible-stats on"
bind "set mark-symlinked-directories on"
bind "set colored-completion-prefix on"
bind "set menu-complete-display-prefix on"

# Case-insensitive tab completion
bind "set completion-ignore-case on"


