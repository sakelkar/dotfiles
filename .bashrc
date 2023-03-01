#/bin/bash
unset LC_CTYPE
#export PATH=/auto/smartdev/bin:/usr/cisco/bin:/bin:/router/bin:/usr/bin:/sbin:/usr/sbin:/auto/iox/bin
export PATH=/auto/smartdev/bin:/usr/cisco/bin:/bin:/router/bin:/usr/bin:/sbin:/usr/sbin:/auto/iox/bin:/users/sakelkar/tools/nvim/bin:/nobackup/sakelkar/tools/clangd/:~/tools/neovim/bin/:/users/sakelkar/.local/bin/
#PS1="$(whoami)@$(hostname):$(pwd):\\$(date) "
#alias nvim="~/tools/neovim/bin/nvim.appimage"
alias cmake="~/tools/cmake/bin/cmake"
alias rg="~/tools/ripgrep/bin/rg"
alias fzy="~/tools/fzy/fzy"
alias mydu="du -k -s $(ls -A)  | sort -k1 -g -r | more"
PS1="\n\[\e[1;30m\][$$:$PPID - \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY:-o} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] '$(DISKUSAGE)' \n\$ "
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

DISKUSAGE_PREFIX='disk:'
DISKUSAGE_SUFFIX='%%'

DISKUSAGE_WARNING='80'  # in percentage
DISKUSAGE_CRITICAL='90' # in percentage

DISKUSAGE_COLOR_WARNING='\033[33m'  # yellow
DISKUSAGE_COLOR_CRITICAL='\033[31m' # red

function DISKUSAGE() {

	# check working directory permissions
	[[ -r . ]] || exit 0

	# get diskusage
	DISKUSAGE_CAPACITY=$(df -P . | sed 1d | awk '{print $5}' | tr -d '%')

	# determines color depending on DISKUSAGE_CAPACITY
	if [ "${DISKUSAGE_CAPACITY}" -ge "${DISKUSAGE_WARNING}" ] ; then DISKUSAGE_COLOR=${DISKUSAGE_COLOR_WARNING} ; fi
	if [ "${DISKUSAGE_CAPACITY}" -ge "${DISKUSAGE_CRITICAL}" ] ; then DISKUSAGE_COLOR=${DISKUSAGE_COLOR_CRITICAL} ; fi

	# output
	echo "${DISKUSAGE_COLOR}${DISKUSAGE_PREFIX}${DISKUSAGE_CAPACITY}${DISKUSAGE_SUFFIX}"
}

alias myps="pstree -a -h -p -s sakelkar"
alias nvimdiff="nvim -d"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
