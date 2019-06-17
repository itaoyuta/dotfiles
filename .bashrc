export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/usr/local/opt:$PATH
export PATH=$PATH:/Users/yutaito/Library/Developer/Xamarin/android-sdk-macosx/platform-tools
export PATH=$PATH:/opt/yarn-[version]/bin
export TERM=xterm-256color
export EDITOR=vim
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export XDG_CONFIG_HOME="$HOME/.config"


#brew-file
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

#brew-file
if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
fi


alias vi='/usr/local/bin/vim'

# # The next line updates PATH for the Google Cloud SDK.
# source '/Users/yutaito/google-cloud-sdk/path.bash.inc'
#
# # The next line enables shell command completion for gcloud.
# source '/Users/yutaito/google-cloud-sdk/completion.bash.inc'
