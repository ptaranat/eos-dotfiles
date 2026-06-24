# GPG
export GPG_TTY=$(tty)

source ~/.zsh_plugins/zsh-snap/znap.zsh

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
znap source djui/alias-tips
znap source marlonrichert/zsh-hist
znap source zdharma-continuum/fast-syntax-highlighting
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

# OMZ lib — only the pieces we actually use, not the whole oh-my-zsh.sh
# framework (prompt=starship, keybindings=zsh-vi-mode, ls=exa already
# override theme-and-appearance/key-bindings/directories' ls aliases).
#   git         -> git_current_branch/git_main_branch (git plugin needs these)
#   directories -> ... / - / 1-9 / md / rd nav aliases
#   history     -> HISTSIZE/SAVEHIST + hist_* setopts (no other history config)
#   completion  -> completion zstyles (menu/colors/matchers)
znap source ohmyzsh/ohmyzsh lib/{git,directories,history,completion}.zsh

# Initialize completions (previously done by oh-my-zsh.sh)
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"

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

# Starship prompt
command -v starship >/dev/null && eval "$(starship init zsh)"
#autoload -U +X bashcompinit && bashcompinit
# autoload -U compinit && compinit

# fnm (Fast Node Manager)
command -v fnm >/dev/null && eval "$(fnm env --use-on-cd)"
