# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tim/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
zstyle ':completion:*' special-dirs true

# Load colors
autoload -U colors && colors
# Need this, so the prompt will work
setopt prompt_subst

ZSH=~/.zsh
EXTRAS=$ZSH/extras
source $ZSH/git.zsh
source $EXTRAS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Tab completion
zstyle ':completion:*:*:*:*' menu select=1
zstyle ':completion:*:*:*:*' verbose yes

# Custom prompt
# From: https://github.com/sjl/oh-my-zsh/blob/master/themes/prose.zsh-theme
function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
  [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function lambda {
  echo 'λ' && return
}

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Distinguish between command and insert mode
# From: http://pthree.org/2009/03/28/add-vim-editing-mode-to-your-zsh-prompt/ 
#terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
#function zle-line-init zle-keymap-select {
#  PS1_2="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#  PS1="%{$terminfo_down_sc$PS1_2$terminfo[rc]%}%~ %# "
#  zle reset-prompt
#}
preexec () { print -rn -- $terminfo[el]; }
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) %{$fg[red]%}$(lambda)%{$reset_color%} '

# Overrides
export PATH=~/.scripts:$PATH
export PATH=/usr/local/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules/
export EDITOR=vim
export SITE_CONTENT_KEY=d41d8cd98f00b204e9800998ecf8427e

alias up='make update'
alias chrome-dev='chromium --disable-web-security 2&> /dev/null &'

[[ -s "/Users/timbranyen/.rvm/scripts/rvm" ]] && source "/Users/timbranyen/.rvm/scripts/rvm"  # This loads RVM into a shell session.
