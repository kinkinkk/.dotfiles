
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.zsh/.oh-my-zsh
export ZAW=$HOME/.zsh/.zaw
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx)

#source $ZSH/oh-my-zsh.sh
[[ "$TERM" != "dumb" ]] && source $ZSH/oh-my-zsh.sh
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='emacs'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
#export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -lG'
alias ls='ls -F'
alias vi='vim'
case ${OSTYPE} in
  darwin*)
    # ここに Mac 向けの設定
    alias emacs='TERM=xterm-256color /usr/local/bin/emacs'
	alias git='/usr/local/bin/git'
esac
alias em='emacs -nw'

if [ $SHLVL = 1 ]; then
	alias tmx='tmux a || tmux new-session \; source-file ~/.tmux/tab01'
fi

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

function history-all { history -E 1 }
function mkcd(){mkdir -p $1 && cd $1}


setopt transient_rprompt

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# 追加分
## 補完機能の強化
autoload -U compinit
compinit
## TAB で順に補完候補を切り替える
setopt auto_menu
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補を詰めて表示
setopt list_packed
## ディレクトリ名だけで cd
setopt auto_cd
## cd 時に自動で push
setopt auto_pushd
## 同じディレクトリを pushd しない
setopt pushd_ignore_dups

## zshrc
source $ZAW/zaw.zsh
bindkey '^h' zaw-cdr
bindkey '^[g' zaw-git-branches
bindkey '^[@' zaw-gitdir

function zaw-src-gitdir () {
	_dir=$(git rev-parse --show-cdup 2>/dev/null)
	if [ $? -eq 0 ]
	then
		candidates=( $(git ls-files ${_dir} | perl -MFile::Basename -nle \
												   '$a{dirname $_}++; END{delete $a{"."}; print for sort keys %a}') )
	fi
	actions=("zaw-src-gitdir-cd")
	act_descriptions=("change directory in git repos")
}

function zaw-src-gitdir-cd () {
	BUFFER="cd $1"
	zle accept-line
}
zaw-register-src -n gitdir zaw-src-gitdir

if [ -z $TMUX ]; then
#    archey & 
fi
