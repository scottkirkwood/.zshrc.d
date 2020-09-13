#!/bin/zsh
# Commands specific to zsh

if [ -n "$BASH_VERSION" ]; then
  return
fi

# Correct command line misspellings.
setopt CORRECT

# Global aliases (expand whatever their position)
#  e.g. find . E L
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g W='| wc -l'

alias zshrc='source ~/.bashrc.d/zsh.sh'

VIM_INS_MODE="INS"
VIM_CMD_MODE="CMD"

VIM_MODE="$VIM_INS_MODE"

function zle-keymap-select zle-line-init {
  VIM_MODE="${${KEYMAP/vicmd/${VIM_CMD_MODE}}/(main|viins)/${VIM_INS_MODE}}"
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

function zle-line-finish {
  VIM_MODE="$VIM_INS_MODE"
  zle reset-prompt
}
zle -N zle-line-finish

#PROMPT='
#%{$bg[black]%}%{$fg[white]%}[%m$(git_prompt_info)] %~ %{$reset_color%}
#[$VIM_MODE %*] %# '
PROMPT='
%{$bg[black]%}%{$fg[white]%}[%m] %~ %{$reset_color%}
[$VIM_MODE %*] %# '

ZSH_THEME_GIT_PROMPT_PREFIX=":"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" !"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Shorten the vi escape timeout.
export KEYTIMEOUT=10

# Set vi cmd mode.
bindkey -v

# 2017-11-27 removed.
# compinit

#cache-path must exist
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# If you only want to complete local directories in git5, uncomment the next line
export BLAZE_COMPLETION_PACKAGE_PATH=%workspace%

# Hash signs can be used in interactive mode.
setopt INTERACTIVE_COMMENTS

# Ctrl-R search back incrementally.
# The string may begin with ^ to anchor the search to the beginning of the line.
bindkey "^R" history-incremental-search-backward

# Emacs style
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

# Redirect '>' can't clobber existing file, use '>!' instead.
setopt NO_CLOBBER

# Extended glob
setopt EXTENDED_GLOB

# If no match found, then pass glob unexpanded (like bash)
setopt NONOMATCH

# tabcomplete any aliases I have as well.
setopt complete_aliases
