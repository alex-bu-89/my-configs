# Personal configs

1. [Brew](#Brew)
1. [iTerm2](#iTerm2)
1. [Fish shell](#Fish-shell)
1. [Atom](#Atom)
1. [VS Code](#VS-code)
1. [NVM with fish shell](#NVM-with-fish-shell)

## Brew

Install
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

or update if outdated
```bash
brew update
```

## iTerm2
[Install](https://www.iterm2.com/downloads.html)

Font: 15px Roboto Mono Medium for Powerline
```bash
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```

## Fish shell

Install
```bash
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

Install Fisher
Fisher is a plugin manager for Fish Shell.

```bash
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

Install Themes and Plugins
```bash
fisher add igalic/anicode
fisher add edc/bass

fisher add oh-my-fish/

# fzy is a fast, simple fuzzy text selector for the terminal with an advanced scoring algorithm.
# https://github.com/jhawthorn/fzy
brew install fzy
fisher add gyakovlev/fish-fzy

brew install grc
fisher add oh-my-fish/plugin-grc
```

NVM on mac for fish users
```
brew upgrade
brew install nvm

mkdir ~/.nvm

# install bass if not installed
git clone https://github.com/edc/bass.git
cd bass
make install

# add to fish config
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent
```

Save config.fish to that path
```bash
~/.config/fish/config.fish
```

config.fish
```bash
# Nice light cyan color instead of dark blue
set -gx LSCOLORS gxfxcxdxbxegedabagacad

# Allow 256 colors in iTerm2 for pretty vim colors
set -gx CLICOLOR 1
set -gx TERM xterm-256color

# Override standard `ls`
function ls --description 'List contents of directory'
  command ls -lFG $argv
end

# Delete all local merged branches except master
function delmerged --description 'Delete all local branches that is already merged to current branch (exludes master)'
  command git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
  command git remote prune origin
end

# NVM config
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

# Remove time stamp on the right side
function fish_right_prompt
  #intentionally left blank
end
```

## Atom

Get installed packages

```bash
apm list --installed --bare > packages.list
```

Install packages

```bash
apm install --packages-file packages.list
```

My atom packages list

```bash
atom-beautify@0.32.5
atom-ternjs@0.18.3
atom-typescript@12.6.2
busy-signal@1.4.3
docblockr@0.13.7
editorconfig@2.2.2
emmet@2.4.3
file-icons@2.1.22
git-plus@7.12.0
git-time-machine@2.1.0
go-plus@5.8.3
hyperclick@0.1.5
intentions@1.1.5
js-hyperclick@1.13.0
line-count@0.5.0
linter@2.2.0
linter-eslint@8.4.1
linter-golinter@1.2.2
linter-ui-default@1.7.1
split-diff@1.5.2
teletype@0.13.3
todo-show@2.3.0
```

## VS Code

Color Theme

```
vscode-theme-onedark
https://marketplace.visualstudio.com/items?itemName=akamud.vscode-theme-onedark
```

## NVM with fish shell
https://medium.com/@joshuacrass/nvm-on-mac-for-fish-users-e00af124c540
