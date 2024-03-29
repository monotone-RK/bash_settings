# .bashrc

###############################################
## Bash Line Editor (begin)                   #
###############################################
[[ $- == *i* ]] && source ${HOME}/ble.sh/out/ble.sh --noattach

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

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
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'

###############################################
## alias                                      #
###############################################
if [[ -x $(which colordiff) ]]; then
    alias diff="colordiff"
fi
if [[ ! -x $(which tree) ]]; then
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

###############################################
## Utility                                    #
###############################################
function add_path() {
    if [[ -e "$1" ]]; then
        export PATH="$(readlink -f "$1"):$PATH"
    fi
}

function add_ldpath() {
    if [[ -e "$1" ]]; then
        export LD_LIBRARY_PATH="$(readlink -f "$1"):$LD_LIBRARY_PATH"
    fi
}

###############################################
## feature of "typeset -U PATH"               #
###############################################
if typeset -A &>/dev/null; then
    typeset -A _paths
    typeset _results
    while read -r _p; do
        if [[ -n ${_p} ]] && ((${_paths["${_p}"]:-1})); then
            _paths["${_p}"]=0
            _results=${_results}:${_p}
        fi
    done <<<"${PATH//:/$'\n'}"
    PATH=${_results/:/}
    unset -v _p _paths _results
else
    typeset _p=$(awk 'BEGIN{RS=":";ORS=":"} !x[$0]++' <<<"${PATH}:")
    PATH=${_p%:*:}
    unset -v _p
fi

###############################################
## ssh-agent                                  #
###############################################
# SSH_AGENT_FILE="${HOME}/.ssh/.ssh-agent.$(hostname)"
# if [ -f ${SSH_AGENT_FILE} ]; then
#     eval $(cat ${SSH_AGENT_FILE})
#     ssh_agent_exist=0
#     for id in $(ps ax | grep 'ssh-agent' | sed -e 's/\([0-9]\+\).*/\1/'); do
#         if [ ${SSH_AGENT_PID} = ${id} ]; then
#             ssh_agent_exist=1
#         fi
#     done
#     if [ $ssh_agent_exist = 0 ]; then
#         rm -f ${SSH_AGENT_FILE}
#         ssh-agent >${SSH_AGENT_FILE}
#         chmod 600 ${SSH_AGENT_FILE}
#         eval $(cat ${SSH_AGENT_FILE})
#         ssh-add
#     fi
# else
#     ssh-agent >${SSH_AGENT_FILE}
#     chmod 600 ${SSH_AGENT_FILE}
#     eval $(cat ${SSH_AGENT_FILE})
#     ssh-add
# fi

###############################################
## Bash Line Editor (end)                     #
###############################################
((_ble_bash)) && ble-attach
