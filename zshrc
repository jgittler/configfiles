#####################
# oh-my-zsh configs #
#####################

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="awesomepanda"

plugins=(git zsh-completions svn)

source $ZSH/oh-my-zsh.sh

######################
# custom zsh configs #
######################
source ~/.nvm/nvm.sh

# use vim as the visual editor export VISUAL=vim
export EDITOR=$VISUAL
export DISABLE_AUTO_TITLE=true

# aliases
alias lh='ls -alF'
alias home='cd ~/procore'
alias be='bundle exec'                                                          
alias br='bin/rails'                                                          
alias brs='bin/rspec'                                                          
alias brk='bin/rake'                                                          
alias vz='vim ~/dotfiles/zshrc'                                                         
alias vv='vim ~/dotfiles/vimrc'                                                         
alias vg='vim ~/dotfiles/gitconfig'
alias vt='vim ~/dotfiles/tmux.conf'
alias v='vim'
alias startredis='redis-server /usr/local/etc/redis.conf'
alias startmem='/usr/local/opt/memcached/bin/memcached'
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Resources/jsc'
alias miex='iex -S mix'
[[ -f ~/.aliases ]] && source ~/.aliases

# fuctions
check() {
  ps aux | grep $1
}

brewupgrade() {
  brew upgrade $1 && brew cleanup $1
}

gitfco() {
  if [[ $(git br | grep -c $1) == 1 ]]; then git br | grep $1 | xargs git co; else git br | grep $1; fi
}

usage() {
  _limit=${1:-"5"}
  _sort=${1:-"3"} # %CPU
  v=$(stty size | cut -d ' ' -f2)
  ps aux | cut -c1-$v | head -n "$_limit" | sort -nrk "$_sort"
}

frailsroutes() {
  brk routes | grep $1 | tr -s " " | sed -e "G;"
}

# paths
export PATH=/usr/local/bin:/usr/local/redis/bin:/usr/local/pgsql/bin:./bin:/usr/local/abbyy/bin:$PATH

# rbenv
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Elixir env var path
source "$HOME/.kiex/scripts/kiex"

# themekit path
PATH="/Users/jasongittler/.themekit:$PATH"

# z stuff
if command -v brew >/dev/null 2>&1; then
  [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi

# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="/usr/local/bin:$PATH"
