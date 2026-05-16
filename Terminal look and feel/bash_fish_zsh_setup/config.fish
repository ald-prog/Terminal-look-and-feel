# ~/.config/fish/config.fish

# Starship prompt
starship init fish | source

# Aliases
alias ls='exa -al --color=always --group-directories-first'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias cd='z'
alias update='sudo pacman -Syu; and yay -Syu'
alias gs='git status'
alias gc='git commit'
alias ga='git add'

# PATH and EDITOR
set -gx PATH $HOME/.local/bin $PATH
set -gx EDITOR nano

# Zoxide
zoxide init fish | source

fastfetch