# dotfiles
## インストール

XCode Command Line Toolsが必要です

```
xcode-select --install
```

上記のインストールが完了したら、下記のコマンドでセットアップが出来ます。

```
# init
bash -c "$(curl -fsSL raw.github.com/Sigsiguma/dotfiles/master/setup.sh)" init

# deploy
bash -c "$(curl -fsSL raw.github.com/okamos/dotfiles/master/setup.sh)" deploy
```
