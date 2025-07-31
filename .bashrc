# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH='/home/diego/.oh-my-bash'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="argmax"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
# OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you don't want the repository to be considered dirty
# if there are untracked files.
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# Uncomment the following line if you want to completely ignore the presence
# of untracked files in the repository.
# SCM_GIT_IGNORE_UNTRACKED="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  One of the following values can
# be used to specify the timestamp format.
# * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# If not set, the default value is 'yyyy-mm-dd'.
# HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
# OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
# OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# To enable/disable Spack environment information
# OMB_PROMPT_SHOW_SPACK_ENV=true  # enable
# OMB_PROMPT_SHOW_SPACK_ENV=false # disable

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

# Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

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

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
#---------------------------------------------------------------------
# Custom
#---------------------------------------------------------------------
neofetch

# from: https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
LS_COLORS=$LS_COLORS:'di=1;35:'; export LS_COLORS

# only use when interacting with 1 repo, if using more then check ~/.ssh/config
# export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_df-sphere"

alias gs="git status"
alias gl="git log"
alias gsts="git stash save"
alias gsp="git stash pop"
alias ga="git add --all"
alias gcvs="git commit -vs"
alias notimeout="unset TMOUT"
alias gd="vim -c 'source ~/.vimrc' -c 'call RunGitGd(\"gd\")' -c 'q'"
alias gc="vim -c 'source ~/.vimrc' -c 'call RunGitGd(\"gc\")' -c 'q'"
alias gm="vim -c 'source ~/.vimrc' -c 'call RunGitGd(\"gm\")' -c 'q'"
alias gu="vim -c 'source ~/.vimrc' -c 'call RunGitGd(\"gu\")' -c 'q'"
alias gdx="vim -c 'source ~/.vimrc' -c 'call RunGitGdx(\"gd\")'"
alias gcx="vim -c 'source ~/.vimrc' -c 'call RunGitGdx(\"gc\")'"
alias gmx="vim -c 'source ~/.vimrc' -c 'call RunGitGdx(\"gm\")'"
alias gux="vim -c 'source ~/.vimrc' -c 'call RunGitGdx(\"gu\")'"
alias gdf="git difftool --tool vimdiff --name-only"
alias gdc="git difftool --tool vimdiff --cached"
alias gdcf="git difftool --tool vimdiff --cached --name-only"
alias gcvs="git commit -vs"
alias gca="git commit --amend"
alias condainfo="conda info --envs"
alias gf="git show --name-only"
alias gff="git show --pretty=%gd --stat"
#alias cat="bat"
alias ai="wsh ai"

# must usse the --ip flag, otherwise will not be able to connect:
alias jupyterlab="jupyter lab --ip 0.0.0.0 --port 8080"

#logout_timeout=$((2*60*60)) #seconds
#export TMOUT=$logout_timeout
#unset TMOUT

# vim in bash
set -o vi
bind '"jk":vi-movement-mode'
bind '"fd":vi-movement-mode'

#============================================================
# fzf 
#============================================================
# Install:
#   $git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#   $~/.fzf/install
#
# Note: this section must be after oh-my-bash config (for completion to work)
# .<tab> to autocomplete, e.g. vim .<tab>, cd .<tab>, etc.
# ctrl + r look up history
# ctrl + t or f grep file 

# Default command to use when input is tty
export FZF_DEFAULT_COMMAND="fd --type f --no-ignore --color=always"
export FZF_DEFAULT_OPTS="-i --preview 'bat --style numbers,changes --decorations always --color always 2>/dev/null {} | head -500' --height 45% --layout=reverse --border --inline-info"
export FZF_COMPLETION_TRIGGER='.'

# Use fd (https://github.com/sharkdp/fd) instead of the default find, faster
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# This command is called when using vim command
_fzf_compgen_path() {
  fd --no-ignore --hidden --follow --exclude ".git" . "$1" 
}

# Use fd to generate the list for directory completion
# This command is called when using cd command 
_fzf_compgen_dir() {
  fd --no-ignore --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#bind -x '"\C-f": vim $(fv)'
#export FZF_CTRL_T_COMMAND='vim $(fzf)'
#export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
#export FZF_CTRL_T_OPTS="--preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

#============================================================
# gatech
#============================================================

#conda activate ml4t 

#export PYTHONPATH=/home/diego/amrnd/gatech/MLFT/project1:/home/diego/amrnd/gatech/MLFT/project1/grading
export LLVM_SRC_ROOT=/home/diego/amrnd/dist/llvm/tools

#============================================================
# bash completion
#============================================================
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/diego/amrnd/am/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/diego/amrnd/am/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/diego/amrnd/am/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/diego/amrnd/am/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#export DISPLAY="localhost:10.0"
#export PATH=~/amrnd/bin:~/amrnd/dist/clang/clang-18.1.8/bin:/usr/local/bin:$PATH
#export LD_LIBRARY_PATH=~/amrnd/dist/clang/clang-18.1.8/lib:/usr/local/lib:/usr/local/lib64:/usr/lib64:$LD_LIBRARY_PATH
export PATH=~/amrnd/bin:~/amrnd/bin_env:$PATH

