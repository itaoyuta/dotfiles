# シンプルな zshrc


export EDITOR=vim
bindkey -v


# 補完機能を有効にする
autoload -Uz compinit
compinit

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups


# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# vim 風キーバインドにする
bindkey -v

# その他とりあえずいるもの
export LANG=ja_JP.UTF-8

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# フローコントロールを無効にする
setopt no_flow_control

# '#' 以降をコメントとして扱う
setopt interactive_comments

# vim:set ft=zsh :

export PATH=/opt/local/bin:/opt/local/sbin:$PATH:~/bin
export PATH=/usr/local/opt/subversion1.7/bin:$PATH
export PATH=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/bin:$PATH
