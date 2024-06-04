# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.

if shopt -q login_shell; then
    # source bashrc on login if file exists
    [[ -f ~/.bashrc ]] && source ~/.bashrc
    # starts hyprland if first tty and session seat is set, ignores output
    [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && 2>/dev/null 1>&2 exec Hyprland
else
    # Somehow this is a non-bash or non-login shell.
    exit 1
fi

