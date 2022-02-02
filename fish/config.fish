#
# Nice light cyan color instead of dark blue
#
set -gx LSCOLORS gxfxcxdxbxegedabagacad

#
# Allow 256 colors in iTerm2 for pretty vim colors
#
set -gx CLICOLOR 1
set -gx TERM xterm-256color

#
# Override standard `ls`
#
function ls --description 'List contents of directory'
  command ls -alFG $argv
end

#
# ~/.config/fish/functions/nvm.fish
#
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

#
# ~/.config/fish/functions/nvm_find_nvmrc.fish
#
function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

#
# Load node.js from .nvmrc
#
function load_nvm --on-variable="PWD"
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)

  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      echo "running nvm install"
      nvm install (cat $nvmrc_path)
    else if test nvmrc_node_version != node_version
      echo "running nvm use"
      nvm use $nvmrc_node_version
    else
      echo "nvm version is uptodate"
    end
  else if test "$node_version" != "$default_node_version"
    echo "Reverting to default Node version"
    nvm use default
  end
end

#
# Check if a directory is changed
#
function __check_rvm --on-variable PWD --description 'Do rvm stuff'
  status --is-command-substitution; and return

  # checking .nvmrc
  # load_nvm
end

#
# Delete all local merged branches except master
#
function delmerged --description 'Delete all local branches that is already merged to current branch (exludes master)'
  command git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
  command git remote prune origin
end
