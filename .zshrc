# Syntax highlighting
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Prompt
autoload -U promptinit

promptinit

PROMPT=" %F{red}%B%n%b%f %B>%b "
RPROMPT="%F{yellow}[%~]%f "

# Terminal title
case "${TERM}" in
    kterm* | xterm)
        precmd() { echo -ne "\033]0;${USER}@${HOST%%.*}\007" }
        ;;
esac

# Auto completion
autoload -U compinit

compinit

zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

# History
setopt share_history
setopt hist_ignore_all_dups

HISTFILE="/home/masaniwa/.zsh_history"
HISTSIZE=256
SAVEHIST=1024

# cd
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

# Environment variable
export PATH=$PATH:"/home/masaniwa/.local/bin"
export LD_PRELOAD="/usr/lib/libv4l/v4l2convert.so"
export CC="clang"
export CXX="clang++"
export EDITOR="vim"

# Alias
alias list="ls -l -F --color"
