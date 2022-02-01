# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# set theme and prompt order

ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_ORDER=(

    status

    time

    dir

    git

#    awsping # custom prompt segment, defined below

    screen

)

# define prompt segment. first get the status from the ec2-status command

 prompt_awsping() {

     prefix=$(ec2-status)

     [[ -z $prefix  ]] && return

     # add a corresponding emoji to make it fancy

     case $prefix in

         running)

             ec2_status=✅

             ;;

         stopped)

             ec2_status=❌

             ;;

     esac

     # add prompt segment built off of existing AWS variables for bg/fg colors and ☁️ prefix, + custom status string + status emoji

     prompt_segment $BULLETTRAIN_AWS_BG $BULLETTRAIN_AWS_FG $BULLETTRAIN_AWS_PREFIX" EC2 ${prefix} ${ec2_status}"

 }

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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"

setopt extended_glob

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/chadyoung/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chadyoung/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/chadyoung/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chadyoung/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# echo "hello chad"
# PROMPT='%B%F{67}%3/ %b%F{green} %#%f '

# Navigation
alias hm='cd ~'
alias tw='cd ~/twinstrandbio'
alias twp='cd ~/twinstrandbio-projects'
alias docs='cd ~/twinstrandbio/docs'
alias dup='cd ~/twinstrandbio/duplex-seq'
alias dsrp='cd ~/twinstrandbio/dsreportr'

alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'

# Listing
alias l='ls -lah'
alias t2='tree -L 2'
alias t3='tree -L 3'

# Git
alias gs='git status'
alias ga='git add -A .'

# Rstudio
alias rstd='open -a RStudio'

# duplex-seq tools
alias ts-tools='java -jar ~/twinstrandbio/duplex-seq/jars/twinstrand-tools.jar'

# EC2
MY_EC2_ID='i-03f64f7cee38cd829'

alias ec2-refresh="export MY_EC2_DNS=$(aws ec2 describe-instances --instance-ids ${MY_EC2_ID} --query 'Reservations[*].Instances[*].PublicDnsName' --output text)"
alias ec2-start="aws ec2 start-instances --instance-id ${MY_EC2_ID}"
alias ec2-stop="aws ec2 stop-instances --instance-id ${MY_EC2_ID}"
alias ec2-login="ec2-refresh && ssh -i ~/.ssh/cyoung.pem ec2-user@${MY_EC2_DNS}"
alias ec2-status="aws ec2 describe-instances --instance-ids ${MY_EC2_ID} --query 'Reservations[*].Instances[*].State' --output text | cut -f2"

ec2-refresh

# mutagen  
msync () {
  projectID="$1"
  ec2Url="$2"

  mutagen sync create --name "$projectID" --configuration-file .mutagen_project.yml ./ "ec2-user@$ec2Url:/home/ec2-user/projectdir/$projectID/"

}

alias sc="source $HOME/.zshrc"

