
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# export PS1="\e[32;1m\]\u@\H:\W $\e[0m\] "

# no colors because iTerm doesn't play nice with colored prompts
export PS1="\W $ "

export PATH="/Users/jcromartie/bin:$PATH"

# for ls, etc.
export CLICOLOR=1
