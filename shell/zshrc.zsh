source "$ZDOTDIR/private.zsh"
# setxkbmap -option caps:swapescape

# navigation
setopt AUTO_CD # Go to folder path without using cd.
setopt AUTO_PUSHD # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT # Do not print the directory stack after pushd or popd.

# turn off beeps
unsetopt BEEP
unsetopt LIST_BEEP

# history
setopt INC_APPEND_HISTORY # append command to history file as typed
setopt EXTENDED_HISTORY # sets timestamp and duration for each command
setopt HIST_IGNORE_ALL_DUPS # do not save duplicated command into history list
setopt HIST_REDUCE_BLANKS # remove unnecessary blanks

# magic space (fills in !!)
bindkey ' ' magic-space

# aliases
alias \
    g="git"\
    ga="git add"\
    gc="git commit"\
    gr="git rm"\
    gs="git status"

# shorten commands
alias \
    v="nvim"\
    z="zathura"\
    l="swaylock"

# colorize when possible
alias \
    ls="ls --color=auto --group-directories-first" \
    grep="grep --color=auto" \
    diff="diff --color=auto"

alias mvi='mpv --config-dir=$HOME/.config/mvi'
alias tree="exa --tree"
alias envim="nvim $XDG_CONFIG_HOME/nvim/init.lua"

# jump back to previous directories
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index # directory stack

# completion options
setopt PROMPT_SUBST
setopt AUTO_LIST # Automatically list choices on ambiguous completion
setopt EXTENDED_GLOB # expands ~, #, ^
setopt LIST_PACKED
setopt AUTO_PARAM_SLASH

# load completion
autoload -Uz compinit; compinit;
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/compcache"
zmodload zsh/complist
_comp_options+=(globdots) # expands dotfiles

# vi mode
bindkey -v
export KEYTIMEOUT=1

## Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

## Change cursor shape for different vi modes. C&Ped.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been     set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Prompt
# Source: https://salferrarello.com/zsh-git-status-prompt/
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# Default Prompt: [%n@%m]%~%#
NEWLINE=$'\n'
PROMPT='[%n@%m]%~%F{red}${vcs_info_msg_0_}%f${NEWLINE}%# '
# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

export LLVM_DIR=/usr/lib/llvm-13

# Plugins
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^ ' autosuggest-accept
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
