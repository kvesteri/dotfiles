for file in ~/.{bash_prompt,exports,aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Initialize RVM
source ~/.rvm/scripts/rvm

# Initialize autoenv
source /usr/local/Cellar/autoenv/0.1.0/activate.sh

# Initialize virtualenvwrapper
source /usr/local/share/python/virtualenvwrapper_lazy.sh

# Append history entries
shopt -s histappend

# Enable bash autocompletion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
