# ---------------------------
# Autor: giovani Oliveira
# Data: 20-10-2016.

#-------------------------------------------------------
# Enable aliases to be sudo’ed
#-------------------------------------------------------
alias sudo='sudo '

#-------------------------------------------------------
# Apps Aliases
#-------------------------------------------------------
alias c='clear'
alias edit='subl'
alias chromo='chromium-browser'
alias apache-restart='sudo apache2ctl restart'

#-------------------------------------------------------
# Apt Aliases
#-------------------------------------------------------
alias add-ppa='sudo add-apt-repository'
alias get-ppa='sudo apt-get update && sudo apt-get install'
alias install='sudo apt-get install'
alias update='sudo apt-get update'
alias zap='sudo apt-get purge'
alias clean='sudo apt-get autoremove'

#-------------------------------------------------------
# Git Aliases
#-------------------------------------------------------
#alias ini='git init'
alias gst='git status'
alias all='git add .'
alias add='git add'
alias dif='git diff'
alias go='git checkout'
alias clone='git clone'
alias comm='git commit -m'
alias coma='git commit -a -m'
alias push='git push origin'
alias pull='git pull origin'
alias copy='git branch'
alias logs='git log --pretty=oneline'
alias undo='git reset HEAD'
alias merge='git merge'
alias reset='git checkout --'

#-------------------------------------------------------
# Vagrant Aliases
#-------------------------------------------------------
# alias vinit='vagrant up'
# alias vpause='vagrat suspend'
# alias vstop='vagrant halt'
# alias vss='vagrant ssh'
# alias vstart='cd Vagrant && vinit'

#-------------------------------------------------------
# Artisan Aliases
#-------------------------------------------------------
alias art="php artisan"
alias seed="art db:seed"
alias rollback="art migrate:rollback"
alias migrate="art migrate"
alias refresh="art migrate:refresh --seed"
alias migrate:make="art migrate:make"
alias tinker="art tinker"
alias gen:ctl="art generate:controller"
alias gen:form="art generate:form"
alias gen:mig="art generate:migration"
alias gen:mod="art generate:model"
alias gen:pivot="art generate:pivot"
alias gen:res="art generate:resource"
alias gen:scaf="art generate:scaffold"
alias gen:seed="art generate:seed"
alias gen:test="art generate:test"
alias gen:view="art generate:view"
