#
# ~/.bash_logout
#

#clear bash history on logout
cat /dev/null > $HOME/.bash_history

#clear cache
rm -rf $HOME/.cache/qutebrowser/*
rm -rf $HOME/.cache/ranger/*
