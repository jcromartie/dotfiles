
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="/Users/jcromartie/bin:$PATH"

thumbsDown=$(printf "\xF0\x9F\x91\x8E")
thumbsUp=$(printf "\xF0\x9F\x91\x8D")
function exitIcon()
{
    if [ $? -eq 0 ]
    then
	echo $thumbsUp
    else
	echo $thumbsDown
    fi
}

moneyBags=$(printf "\xF0\x9F\x92\xB0")

export PS1='[\[\033[33;1m\]\d \T\[\033[0m\] \[\033[32;1m\]\u@\h \[\033[34m\]\W\[\033[0m\]] $(exitIcon)  \[\033[35m\]$(git current-branch)\[\033[0m\]\n\$ '

# for ls, etc.
export CLICOLOR=1
