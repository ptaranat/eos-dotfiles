# Paths
path=($HOME/.local/bin $path)
path=($HOME/bin $path)
path=($PYENV_ROOT/bin $path)

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

# Notes directory
export NOTES_DIR='$HOME/Documents/notes'

# Language
export LANG=en_US.UTF-8

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
