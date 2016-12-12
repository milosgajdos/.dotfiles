export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

export GOPATH=$HOME/go
export GOROOT='/usr/local/go'
export EDITOR='vim'
export PATH=$PATH:$GOPATH/bin

if test "${PS1+set}"
then
  export CDPATH=.:~:$GOPATH/src:$GOPATH/src/github.com:$GOPATH/src/github.com/milosgajdos83:$GOPATH/src/code.google.com/p:$GOPATH/src/bitbucket.org
fi

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

source ~/.bash/bash_aliases
source ~/.bash/bash_completions
source ~/.bash/git_aliases

# The next line updates PATH for the Google Cloud SDK.
source '/Users/milosgajdos/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/milosgajdos/google-cloud-sdk/completion.bash.inc'

# awscli auto complete
complete -C aws_completer aws

# start ssh-agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
fi

# do the python virtualenv shitshow
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
