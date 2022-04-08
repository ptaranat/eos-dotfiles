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
# znap install ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh \
	plugins/{archlinux,colored-man-pages,gpg-agent} \
	plugins/{git,gitfast,git-extras} \
	plugins/{python,pip} \
	plugins/golang \
	plugins/{node,npm,yarn} \
	plugins/{ruby,gem} \
	plugins/{ansible,aws,terraform}

znap source aloxaf/fzf-tab
znap install lukechilds/zsh-nvm
znap source djui/alias-tips
znap source marlonrichert/zsh-hist
znap source zdharma/fast-syntax-highlighting
znap eval zoxide "zoxide init --cmd j zsh"
znap source jeffreytse/zsh-vi-mode
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
# Don't install fzf as this plugin does
zvm_after_init_commands+=('znap source unixorn/fzf-zsh-plugin')
# Zsh-users
znap source zsh-users/zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-users/zsh-autosuggestions

znap source ohmyzsh/ohmyzsh
# Speed up pasting w/ autosuggest
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

plugins=()

# User configuration
export ZSH_CUSTOM="$HOME/.zsh"
# Source custom zsh files
for config ($HOME/.zsh/*.zsh) source $config

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#autoload -U +X bashcompinit && bashcompinit
# autoload -U compinit && compinit

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
