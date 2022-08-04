# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $HOME/.zsh_theme
source $HOME/.oh-my-zsh-custom

##################################################
# PATH
##################################################
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export PATH="/Users/chadyoung/.cargo/bin:$PATH"

setopt extended_glob

##################################################
# aliases
##################################################
alias sc="source $HOME/.zshrc"

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

# conda/mamba environment
alias myenv='mamba activate dsrpEnv'

# Git
alias gs='git status'
alias ga='git add -A .'

# Rstudio
alias rstd='open -a RStudio'

# duplex-seq tools
alias ts-tools='java -jar ~/twinstrandbio/duplex-seq/jars/twinstrand-tools.jar'

##################################################
## grep
##################################################
rgrep () {
    grep -nr --include \*.R --include \*.Rmd --include \*.rmd --include \*.md $1
}

##################################################
# EC2
##################################################
MY_EC2_ID='i-03f64f7cee38cd829'

alias ec2-refresh='export MY_EC2_DNS=$(aws ec2 describe-instances --instance-ids ${MY_EC2_ID} --query "Reservations[*].Instances[*].PublicDnsName" --output text)'
alias ec2-start="aws ec2 start-instances --instance-id ${MY_EC2_ID}"
alias ec2-stop="aws ec2 stop-instances --instance-id ${MY_EC2_ID}"
alias ec2-login='ec2-refresh && ssh -i ~/.ssh/cyoung.pem ec2-user@${MY_EC2_DNS}'
alias ec2-status="aws ec2 describe-instances --instance-ids ${MY_EC2_ID} --query 'Reservations[*].Instances[*].State' --output text | cut -f2"

ec2-refresh

##################################################
# mutagen  
##################################################
msync () {
  projectID="$1"
  ec2Url="$2"

  mutagen sync create --name "$projectID" --configuration-file .mutagen_project.yml ./ "ec2-user@$ec2Url:/home/ec2-user/projectdir/$projectID/"

}

CUR_PRJ="prj00163-devon-ecoli-support3"
CUR_PRJ_DIR="${HOME}/twinstrandbio-projects/${CUR_PRJ}/"
alias curprj="cd ${CUR_PRJ_DIR}"

msync_cur () {
    pushd ${CUR_PRJ_DIR}
    msync ${CUR_PRJ} ${MY_EC2_DNS}
    popd
}

alias mlist='mutagen sync list'
alias mterm_cur='mutagen sync terminate ${CUR_PRJ}'



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

if [ -f "/Users/chadyoung/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/Users/chadyoung/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export PATH="$HOME/.poetry/bin:$PATH"
