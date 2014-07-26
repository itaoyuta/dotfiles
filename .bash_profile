export PATH=/usr/local/bin:$PATH
export EDITOR=/Applications/MacVim.app/Contents/MacOs/Vim
export GOPATH=~/.go
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias safari='open -a safari'

#java settings
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

#rbenv,pyenvの初期化
eval "$(rbenv init -)"
eval "$(pyenv init -)"




# MacPorts Installer addition on 2011-08-23_at_18:15:04: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH:~/bin
# Finished adapting your PATH environment variable for use with MacPorts.
