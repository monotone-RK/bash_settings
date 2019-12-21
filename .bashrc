# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

###############################################
## screen style                               #
###############################################
export PS1="\[\e[0;35m\][\u@\h] \$\[\e[0m\] "


###############################################
## bash completion                            #
###############################################
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi


###############################################
## export                                     #
###############################################
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30" 


###############################################
## command's history                          #
###############################################
export HISTCONTROL=ignoredups
export HISTIGNORE="cd*:pwd*:fg*:bg*"
export HISTSIZE=10000

###############################################
## alias                                      #
###############################################
if [[ -x `which colordiff` ]]; then
    alias diff="colordiff"
fi
if [[ ! -x `which tree` ]]; then
    alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
fi
alias gls="gls --color"
alias jitac="java -jar ~/bin/jitac-0.2.0.jar"
alias ll="ls -ltr"
alias sshx="ssh -Y"
alias sc="screen -D -RR"
alias pycat="pygmentize"
alias emacs='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
alias grep="grep --color=always"
alias egrep="egrep --color=always"
alias fgrep="fgrep --color=always"
alias zgrep="zgrep --color=always"
alias pdfgrep="pdfgrep --color=always"
alias ls="ls --color"
