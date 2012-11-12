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

# Enable git autocompletion
source /usr/local/etc/bash_completion.d/.git-completion.sh
