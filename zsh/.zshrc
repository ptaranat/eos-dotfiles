# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# GPG
export GPG_TTY=$(tty)

source ~/.zsh_plugins/zsh-snap/znap.zsh

znap source romkatv/powerlevel10k

# Plugins
znap source ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh \
	plugins/{git,archlinux,autojump,colored-man-pages,gpg-agent} \
	plugins/{fd,fzf} \
	plugins/{python,pip} \
	plugins/golang \
	plugins/{ansible,aws,docker,terraform}

znap source djui/alias-tips
znap source marlonrichert/zsh-hist
znap source zdharma/fast-syntax-highlighting
znap source changyuheng/zsh-interactive-cd

# Zsh-users
znap source zsh-users/zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-users/zsh-autosuggestions

plugins=()

# User configuration
export ZSH_CUSTOM="$HOME/.zsh"
# Source custom zsh files
for config ($HOME/.zsh/*.zsh) source $config

# GitHub CLI completions
if [[ ! -d "$ZSH/completions" || ! -f "$ZSH/completions/_gh" ]]; then
	mkdir -pv $ZSH/completions
	gh completion --shell zsh > $ZSH/completions/_gh
	echo "gh added completions: gh completion --shell zsh > $ZSH/completions/_gh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit
