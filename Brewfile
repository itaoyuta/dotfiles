#参考 : http://qiita.com/hidekuro/items/4c926587f3a1cb2ec1e0
#前提 : AppStore より Xcode の最新版がインストールされていて、Xcodeのコマンドラインツールがインストールされている
#その他
#バージョン指定してインストール : http://qiita.com/semind/items/f8f647e757842f08b9ec
#rbenvとpyenvは必要に応じて設定ひとまずは、systemのdefaultを利用している
#
#ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#あとは以下設定を読み込ませる
#brew bundle ~/Brewfile

#Add repositories
tap homebrew/versions || true
tap caskroom/cask || true
tap caskroom/versions || true

#Homebrewを最新版にアップデート
update || true

#Install formulae
install brew-cask || true
install wget || true
install git || true
install subversion17 || true
install ag || true
install yuicompressor || true
install rbenv ruby-build || true
install pyenv || true
install node || true
install go || true

#Install Cask formulae
#cask install google-chrome || true
cask install java || true
cask install java7 || true


