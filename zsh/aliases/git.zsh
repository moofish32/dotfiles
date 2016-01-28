alias gst='git status'
alias gd='git diff'
alias gp='git pull'
alias gp!='git push'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gco='git checkout'
alias gcob='git checkout -b'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias glgga='git log --graph --decorate --all'
alias glo='git log --oneline'
alias gr='git remote'
alias gra='git remote add'
alias grs='git remote show'
alias grv='git remote -v'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbm='git rebase -i master'
alias gb='git branch'
alias gba='git branch -a'
alias gbd!='git branch -D'
alias ga='git add'
alias grhh='git reset HEAD --hard'
alias gclean='git reset --hard && git clean -dfx'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
# Will cd into the top of the current repository
# or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

alias gpr='git pull --rebase'
alias gcot='git checkout -t'
alias gw='git add --all . && git commit -m 'WIP' && git push'
alias gwip="git add --all . && git commit -m 'WIP'"
alias patch='git format-patch HEAD^ --stdout > patch.diff'
alias sync='git add -u . && git commit -m "Minor changes. Commit message skipped." && repush'
alias repush="gpr && git push"
alias gsfba='git submodule foreach git branch'
alias gsfnm='git submodule foreach git branch | grep -v "* master"'
alias gcd='git checkout dev'
alias gsp='git stash pop'
alias gs='git stash'
alias gscfn='gsfe git clean -fxdn'
alias gscf='gsfe git clean -fxd'
alias gdt='git difftool'
alias gmt='git mergetool'
alias grbs='git rebase --skip'
alias gsui='git submodule update --init'
alias gib='git init --bare'
alias glm='ls -al `git status | grep modified | cut -d":" -f2`'

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

alias gsr='git svn rebase'
alias gsd='git svn dcommit'
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"

alias gaa='git add --all .'
alias gaad='git ls-files --deleted | xargs git rm'
alias gcfn='git clean -f -d -n'
alias gcf='git clean -f -d'
alias gcl='git clone'
alias gcm="git commit -m"
alias gcam="git commit -am"
alias gdm='git diff master'
alias gf='git fetch'
alias glgs=pretty_git_log -5
alias gm='git checkout master'
alias gm!='git merge'
alias gta='git tag -a'
alias gpt='git push --tags origin master'
alias gsa='git submodule add'
alias gsdi='git submodule deinit'
alias gsi='git submodule init'
alias gsu='git submodule update'
alias gsfe='git submodule foreach'
alias gsfb='git submodule foreach git checkout -b'
alias gsfco='git submodule foreach git checkout'
alias gsfd="git submodule foreach 'git checkout dev || true'"
alias gsfm='git submodule foreach git checkout master'
alias gsfp='git submodule foreach git pull --rebase'
alias gsfp!='git submodule foreach git push'

# Deprecated
alias gl='echo "Use gp instead"'

function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
function gbsu {
  branch=$(git symbolic-ref --short -q HEAD)

  if [[ $# > 0 ]]
  then
    target=$1
  else
    target=$branch
  fi

  git branch --set-upstream-to=origin/$target $branch
}
