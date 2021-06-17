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

# Edit configs
alias zshrc="$EDITOR ~/.zshrc"
alias zshalias="$EDITOR ~/.zsh/06-aliases.zsh"
alias zshenv="$EDITOR ~/.zsh/01-environment.zsh"
alias vimrc="$EDITOR ~/.vim/general.vim"
alias vimplug="$EDITOR ~/.vim/plugins.vim"
alias vimplugs="$EDITOR ~/.vim/plugin-settings.vim"
alias vimui="$EDITOR ~/.vim/ui.vim"

# Toys
alias weather="curl wttr.in"
alias disks='echo "╓───── m o u n t . p o i n t s"; \
			echo "╙────────────────────────────────────── ─ ─ "; \
			lsblk -a; echo ""; \
			echo "╓───── d i s k . u s a g e";\
			echo "╙────────────────────────────────────── ─ ─ "; \
			df -h;'

# GitHub CLI
alias ghc="gh repo clone"

# Files
alias -s md="glow -p"

# Search for aliases
function what() {
	if [ "$1" != "" ]
	then
		alias | grep --color=always "$1" | bat
	else
		alias | bat
	fi
}

# Make folder then cd
function mcd() {
	if [ "$1" != "" ]
	then
		mkdir -p $1 ; cd $1
	else
		echo "Missing folder name"
	fi
}
