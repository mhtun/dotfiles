# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


if [ -f `which powerline-daemon` ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/share/powerline/bash/powerline.sh
fi

alias vim="nvim"
alias workon_msm="export PYTHONPATH=/home/mtun/src/msm2/common/src:/home/mtun/src/msm2/bauth/src:/home/mtun/src/msm2/agent/src:/home/mtun/src/msm2/agent/testhelpers:/home/mtun/src/msm2/bauth/testhelpers:/home/mtun/src/msm2/common/testhelpers:/home/mtun/src/msm2/ui/server/src:/home/mtun/src/msm2/tools/softtoken-mgr"
export CODE_DIR=/home/mtun/src/msm2

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias machine-reset="sudo bash -c \"rm -rf /var/lib/machines/*\""
