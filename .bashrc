# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
# ----- ----- ----- -----

# enabling gpg-agent ioctl
export GPG_TTY=$(tty)
# start authentication agent if none available
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
# retrieve already running authentication agent
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# change starship configuration location
export STARSHIP_CONFIG=~/.config/starship/starship.toml
# add starship prompt customization
eval "$(starship init bash)"
# add zoxide to shell - a smarter cd
eval "$(zoxide init --cmd cd bash)"

# alias
alias reboot='doas reboot' # alias for reboot
alias shutdown='doas shutdown -h now' # alias for shut down now

alias ls='eza --long --icons=always --all --git' # alias for ls with eza
alias vi='nvim' # alias for neovim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

