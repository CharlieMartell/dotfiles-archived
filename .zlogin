
cat << EOF
$(cowsay -f moose "Welcome $USER" | toilet --gay -f term) 

      $(date)
EOF


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
