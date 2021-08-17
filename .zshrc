export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/opt:$PATH
export TERM=xterm-256color
export EDITOR=vim
export PROMPT='[%n@%m]# '
#export HOMEBREW_CACHE=/opt/homebrew/cache
alias vi='/usr/local/bin/vim'

#brew-file
#if [ -f $(brew --prefix)/etc/brew-wrap ];then
#  source $(brew --prefix)/etc/brew-wrap
#fi

#brew-file
# なんか動かなくなった泣
source $(brew --prefix nvm)/nvm.sh
if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi
# source /usr/local/opt/nvm/nvm.sh


#peco
function peco-history-selection() {
	BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
	CURSOR=$#BUFFER
	zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection




# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# pyenv_virtualenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


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
# source '/Users/yutaito/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
# source '/Users/yutaito/google-cloud-sdk/completion.zsh.inc'
#eval $(/usr/libexec/path_helper -s)

#export PATH="$HOME/.fastlane/bin:$PATH"



# vcs_infoを読み込み
autoload -Uz vcs_info
 
# vcs_info_msg_0_変数をどのように表示するかフォーマットの指定
## デフォルトのフォーマット
### %s: どのバージョン管理システムを使っているか（git, svnなど）
### %r: リポジトリ名
### %b: ブランチ名
zstyle ':vcs_info:*' formats '(%r)[%b]'
## 特別な状態（mergeでコンフリクトしたときなど）でのフォーマット
### %a: アクション名（merge, rebaseなど）
zstyle ':vcs_info:*' actionformats '(%r)[%b|%a]'
 
# プロンプトが表示される毎にバージョン管理システムの情報を取得
## precmd: プロンプトが表示される毎に実行される関数
## vcs_info: バージョン管理システムから情報を取得
precmd () { vcs_info }
 
# 右プロンプトに表示
## prompt_subst: プロンプトを表示する際に変数を展開するオプション
setopt prompt_subst
## vcs_info_msg_0_: バージョン管理システムの情報
## RPROMPT: 右プロンプトに情報を表示するときの環境変数
RPROMPT=%F{238}$RPROMPT'${vcs_info_msg_0_}'%f


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yutaito/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yutaito/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yutaito/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yutaito/google-cloud-sdk/completion.zsh.inc'; fi
