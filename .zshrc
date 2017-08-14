export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/opt:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export TERM=xterm-256color
export EDITOR=vim
export PROMPT='[%n@%m]# '
export HOMEBREW_CACHE=/opt/homebrew/cache
alias vi='/usr/local/bin/vim'

#brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

#brew-file
# なんか動かなくなった泣
# source $(brew --prefix nvm)/nvm.sh
# if [[ -s ~/.nvm/nvm.sh ]];
#  then source ~/.nvm/nvm.sh
# fi
source /usr/local/Cellar/nvm/0.31.0/nvm.sh


#peco
function peco-history-selection() {
	BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
	CURSOR=$#BUFFER
	zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection


# rbenv
eval "$(rbenv init -)"



# 履歴
HISTFILE=~/.zsh_history

# メモリ上に保存される件数（検索できる件数）
HISTSIZE=100000

# ファイルに保存される件数
SAVEHIST=100000

# 履歴を複数の端末で共有する
setopt share_history
#
# # 直前と同じコマンドの場合は履歴に追加しない
setopt hist_ignore_dups
#
# # 重複するコマンドは古い法を削除する
setopt hist_ignore_all_dups
#
# # 複数のzshを同時に使用した際に履歴ファイルを上書きせず追加する
setopt append_history	

# The next line updates PATH for the Google Cloud SDK.
source '/Users/yutaito/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/yutaito/google-cloud-sdk/completion.zsh.inc'
eval $(/usr/libexec/path_helper -s)
