export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "
# erase duplicates from bash history
export HISTCONTROL=ignoreboth:erasedups

export GOPATH=$HOME/go
export EDITOR='vim'
export PATH="/usr/local/opt/python/libexec/bin:$PATH:$GOPATH/bin"
export GO111MODULE=on

if test "${PS1+set}"
then
  export CDPATH=.:~:$GOPATH/src:$GOPATH/src/github.com:$GOPATH/src/github.com/milosgajdos83:$GOPATH/src/code.google.com/p:$GOPATH/src/bitbucket.org
fi

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

source ~/.bash/bash_aliases
source ~/.bash/bash_completions
source ~/.bash/git_aliases

# awscli auto complete
complete -C aws_completer aws

# do the python virtualenv shitshow
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

## The next line updates PATH for the Google Cloud SDK.
#if [ -f /Users/milosgajdos/Code/google-cloud-sdk/path.bash.inc ]; then
#  source '/Users/milosgajdos/Code/google-cloud-sdk/path.bash.inc'
#fi
#
## The next line enables shell command completion for gcloud.
#if [ -f /Users/milosgajdos/Code/google-cloud-sdk/completion.bash.inc ]; then
#  source '/Users/milosgajdos/Code/google-cloud-sdk/completion.bash.inc'
#fi
#source /usr/local/etc/bash_completion
#source <(kubectl completion bash)

export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key)

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.ngs/bin:$PATH"  #Add NGS utility to the path
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# GPG TTY setting
export GPG_TTY=$(tty)

export PATH=.bundle/binstubs:$PATH
export AWS_VAULT_BACKEND="keychain"
