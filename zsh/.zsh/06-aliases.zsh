# Aliases
alias reload="exec zsh"
alias e=$EDITOR
alias c="clear"

# Overrides
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -I"

# Replace ls with exa
alias ls="exa"
alias l="exa --group-directories-first"
alias ll="exa -l --group-directories-first --git"
alias la="exa -la --group-directories-first --git"
alias lm="exa -ls modified --group-directories-first --reverse --git"
alias lmr="exa -ls modified --group-directories-first --git"

# Toys
alias weather="curl wttr.in"

# Search for aliases
function what() {
	if [ "$1" != "" ]
	then
		alias | grep --color=always "$1" | bat
	else
		alias | bat
	fi
}
