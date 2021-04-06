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

**Install color presets**
```shell
git clone https://github.com/mbadolato/iTerm2-Color-Schemes.git
cd schemes
// Use Solarized Dark OR import Floraverse.itermcolors
```

## Fish shell

**Install**

```bash
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

**Install Fisher**

Fisher is a plugin manager for Fish Shell.

```bash
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
```

**Install Plugins**

```bash
fisher add igalic/anicode
fisher add edc/bass

# fzy is a fast, simple fuzzy text selector for the terminal with an advanced scoring algorithm.
# https://github.com/jhawthorn/fzy
brew install fzy
fisher add gyakovlev/fish-fzy

brew install grc
fisher add oh-my-fish/plugin-grc
```

**Install Theme**

```bash
// install theme manager
fisher add oh-my-fish/
// OR
curl -L https://get.oh-my.fish | fish

// install theme
omf install agnoster

// use theme
omf theme agnoster
```

**NVM on mac for fish users**
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

nvm install 12
nvm use 12
nvm alias default 12
```

**Save [config.fish](./fish/config.fish) under the following path**
```bash
~/.config/fish/config.fish
```

## VS Code

Color Theme

```
vscode-theme-onedark
https://marketplace.visualstudio.com/items?itemName=akamud.vscode-theme-onedark
```

## NVM with fish shell
https://medium.com/@joshuacrass/nvm-on-mac-for-fish-users-e00af124c540
