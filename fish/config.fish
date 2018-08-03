# Nice light cyan color instead of dark blue
set -gx LSCOLORS gxfxcxdxbxegedabagacad

# Allow 256 colors in iTerm2 for pretty vim colors
set -gx CLICOLOR 1
set -gx TERM xterm-256color

# Set GOPATH and GOROOT
set -gx GOPATH $HOME/go
set -gx GOROOT (go env GOROOT)

# Override standard `ls`
function ls --description 'List contents of directory'
  command ls -lFG $argv
end

# Delete all local merged branches except master
function delmerged --description 'Delete all local branches that is already merged to current branch (exludes master)'
  command git branch --merged | grep -v "\*" | grep -v "master" | xargs -n 1 git branch -d
  command git remote prune origin
end
