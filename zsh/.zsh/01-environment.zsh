# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# Scroll in less
export LESS='--mouse --wheel-lines=3 -r'

# Bat theme
export BAT_THEME=base16

# Language
export LANG=en_US.UTF-8
