# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/alex/.zsh/completions:"* ]]; then export FPATH="/Users/alex/.zsh/completions:$FPATH"; fi

source ~/.zshrc.secrets

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-better-npm-completion)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR="nvim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GOOGLE_APPLICATION_CREDENTIALS="/Users/alex/credentials/entr-operations-dev.json"

# Remove some ads when running "npm install"
# https://www.npmjs.com/package/opencollective-postinstall
export DISABLE_OPENCOLLECTIVE=true

export NODE_ENV=development
export PLANNED_ENV=development

# Add neovim path
export PATH="$PATH:$HOME/nvim-macos/bin" 

# Add android sdk
export PATH="$PATH:$HOME/android_sdk/cmdline-tools/latest/bin" 

# Add brew to path
export PATH=/opt/homebrew/bin:$PATH

eval "$(starship init zsh)"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Add '~/.local/bin' to the `$PATH`
export PATH="$HOME/.local/bin:$PATH";

# Force git to be in English
alias git='LANG=en_US git'

# ssh-add -K ~/.ssh/abeauchemin-planned-Gi

# Add neovim aliases
alias v='nvim'
alias vim='nvim'
alias oil='nvim -c Oil'

alias asdf='cd ~/planned'
alias qa='exit'
alias qq='exit'
alias :qa='exit'
alias lock='open -b com.apple.ScreenSaver.Engine'
alias :lock='open -b com.apple.ScreenSaver.Engine'
alias gg='echo wp'

# Search and open the selected file in neovim
alias fuzzy='fzf --preview="cat {}" | xargs -r nvim'

# Refresh state of all branches from origin. Useful with lazygit so it flags all the local branches that were merged/removed
alias gitf='git fetch --all --prune --tags --prune-tags --progress'
# Fix errors similar to `cannot lock ref ...`
alias gitfix="find .git -type f -name '*.lock' -delete && git gc --prune=now && git remote prune origin && rm -rf .git/refs/remotes/origin"

plugins+=( 
    # other plugins...
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Init zoxide and replace cd
eval "$(zoxide init zsh)"
alias cd='z'

PATH=~/.console-ninja/.bin:$PATH
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alex/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alex/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alex/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alex/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# Handle hidden/dotfiles by default
# https://askubuntu.com/questions/259383/how-can-i-get-mv-or-the-wildcard-to-move-hidden-files
setopt globdots
. "/Users/alex/.deno/env"
# bun completions
[ -s "/Users/alex/.bun/_bun" ] && source "/Users/alex/.bun/_bun"

# Carapace autocompletion
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)


# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "`fnm env`"
fi
# Automatic version switching
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --resolve-engines --shell zsh)"

# vim mode for command line
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
