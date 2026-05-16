🔧 This setup gives you the best of both worlds:

✅ Bash compatibility for scripting
✅ Fish-like experience for your Konsole terminal
🧰 Step-by-Step: Bash with Fish-like Appearance
1. ✅ Use Bash as your shell

Make sure your shell is Bash:

echo $SHELL

If not, set it:

chsh -s /bin/bash

2. 🌟 Install Fish-like Tools

sudo pacman -S starship zoxide fzf exa bat
yay -S bash-preexec

3. ✨ Configure ~/.bashrc for a Fish-like Experience

nano ~/.bashrc



Paste this:

# Enable Starship prompt
eval "$(starship init bash)"

# Enable zoxide smart cd
eval "$(zoxide init bash)"

# Aliases (like Fish)
alias ls='exa -al --color=always --group-directories-first'
alias cat='bat'
alias cd='z'
alias update='sudo pacman -Syu && yay -Syu'
alias gs='git status'
alias ga='git add'
alias gc='git commit'

# Fuzzy file finder
export FZF_DEFAULT_COMMAND='fd --type f'

# Helpful environment
export EDITOR=nano
export PATH="$HOME/.local/bin:$PATH"

# bash-preexec (optional, for command preview and hooks)
[[ -f ~/.bash-preexec/bash-preexec.sh ]] && source ~/.bash-preexec/bash-preexec.sh

# Flutter environment setup
unset rc
export PATH="$HOME/flutter/bin:$PATH"

fastfetch
. "$HOME/.cargo/env"




4. 🧠 Optional: Add Plugins for Extra Fish-like Features
a) bash-preexec for Fish-style command preview

Clone the plugin:

git clone https://github.com/rcaloras/bash-preexec.git ~/.bash-preexec

Add this to your .bashrc:

[[ -f ~/.bash-preexec/bash-preexec.sh ]] && source ~/.bash-preexec/bash-preexec.sh

b) Syntax highlighting (Fish-style)

Bash doesn't support this natively. Use:

yay -S bash-git-prompt

Or switch to zsh for built-in plugins like zsh-syntax-highlighting.


Paste this in: /.config/fish/config.fish

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

#For zshrc

# ~/.zshrc

# Enable Starship prompt
eval "$(starship init zsh)"

# Aliases
alias ls='exa -al --color=always --group-directories-first'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias cd='z'
alias update='sudo pacman -Syu && yay -Syu'
alias gs='git status'
alias gc='git commit'
alias ga='git add'

# Environment
export EDITOR=nano
export PATH="$HOME/.local/bin:$PATH"

# Enable zoxide
eval "$(zoxide init zsh)"

# Optional: enable completion
autoload -Uz compinit
compinit

fastfetch


5. 🎨 Customize Starship for Fish Look

mkdir -p ~/.config
nano ~/.config/starship.toml

Paste this:

# -------------------------------------------------------------
# Starship Prompt Configuration
# Adapted for KDE Breeze Dark theme (Konsole)
# By Arnold
# -------------------------------------------------------------

palette = "breeze_dark"

format = """
[](mauve)\
$os\
$username\
$hostname\
[](bg:yellow fg:mauve)\
$directory\
[](fg:yellow bg:blue)\
$git_branch\
$git_status\
[](fg:blue bg:green)\
$c\
$rust\
$golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:green bg:surface2)\
$time\
[ ](fg:surface2)\
$cmd_duration\
$line_break\
$character
"""

# ------------------ OS ------------------

[os]
disabled = false
style = "bg:mauve fg:crust"
format = "[$symbol]($style)"

[os.symbols]
Windows = ""
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = "󰀵"
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
Arch = "󰣇"
EndeavourOS = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

# ------------------ USER ------------------

[username]
show_always = true
style_user = "bg:mauve fg:crust"
style_root = "bg:red fg:crust"
format = "[$user]($style)"

# ------------------ HOSTNAME ------------------

[hostname]
ssh_only = false
style = "bg:mauve fg:crust"
format = "[@$hostname]($style)"

# ------------------ DIRECTORY ------------------

[directory]
style = "fg:crust bg:yellow"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = " "
"Pictures" = " "

# ------------------ GIT ------------------

[git_branch]
symbol = ""
style = "bg:blue fg:crust"
format = "[$symbol $branch]($style)"

[git_status]
style = "bg:blue fg:crust"
format = "[$all_status$ahead_behind]($style)"

# ------------------ LANGUAGES ------------------

[c]
symbol = " "
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[rust]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[golang]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[nodejs]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[php]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[java]
symbol = " "
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[kotlin]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[haskell]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)]($style)"

[python]
symbol = ""
style = "bg:green fg:crust"
format = "[$symbol($version)(#$virtualenv)]($style)"

# ------------------ COMMAND DURATION ------------------

[cmd_duration]
show_milliseconds = true
format = " in $duration "
style = "bg:lavender fg:crust"
disabled = false
show_notifications = true
min_time_to_notify = 45000

# ------------------ TIME ------------------

[time]
disabled = false
time_format = "%R"
style = "bg:surface2"
format = "[ $time]($style)"

# ------------------ PROMPT CHARACTER ------------------

[character]
success_symbol = "[❯❯❯](bold fg:green)"
error_symbol = "[❯❯❯](bold fg:red)"

# ------------------ COLOR PALETTE ------------------

[palettes.breeze_dark]
rosewater = "#eff0f1"  # Light gray text
flamingo = "#9b59b6"   # Purple-pink
pink = "#c678dd"       # Softer magenta
mauve = "#9b59b6"      # Main mauve tone
red = "#ed1515"        # Breeze red
peach = "#f67400"      # Orange accent
yellow = "#fdbc4b"     # Soft yellow
green = "#11d116"      # Bright green
blue = "#1d99f3"       # Breeze blue
lavender = "#8fa1b3"   # Muted cyan-blue
text = "#eff0f1"       # Default text
surface2 = "#31363b"   # Panel gray
crust = "#232629"      # Background


✅ Result

You get:

    Modern Fish-like prompt (starship)

    Smart cd (zoxide)

    Enhanced ls/cat/find (exa, bat, fd)

    Aesthetic Git branch, version display, emoji icons

    Still using bash, so all scripts and CLI tools work as expected
