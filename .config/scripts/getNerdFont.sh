site="https://api.github.com"
repos="/repos/ryanoasis/nerd-fonts/releases/latest"

gitup=$(curl https://api.github.com --quiet 2>/dev/null)

if [ "$gitup" ]; then
     echo "git is up"
    # if [ "curl 'https://api.github.com' 2>/dev/null" ] ; then
    #     echo "true"
    # else
    #     echo "false"
    # fi
    echo "$gitup"
else
    echo "git is down"
    echo "$gitup"
fi

