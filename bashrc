if [ -f /etc/bash_completion.d/git-prompt ]; then
    # PS1=${PS1:0:-3}'\[\033[01;33m\]$(__git_ps1)\[\033[00m\]\$ '
    PS1=${PS1%w*}'W\[\033[01;33m\]$(__git_ps1)\[\033[00m\]\$ '
fi
