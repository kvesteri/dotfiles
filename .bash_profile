for file in ~/.{bash_prompt,exports,aliases}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Initialize autoenv
source `brew --prefix`/opt/autoenv/activate.sh

# Initialize virtualenvwrapper
source /usr/local/share/python/virtualenvwrapper_lazy.sh

# Append history entries
shopt -s histappend

# Enable bash autocompletion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# The use_env call below is a reusable command to activate/create a new Python
# virtualenv, requiring only a single declarative line of code in your .env files.
# It only performs an action if the requested virtualenv is not the current one.
use_env() {
  typeset venv
  venv="$1"
  if [[ `basename "${VIRTUAL_ENV:t}"` != "$venv" ]]; then
    if workon | grep $venv > /dev/null; then
      workon "$venv"
    else
      echo -n "Create virtualenv $venv now? (Yn) "
      read answer
      if [[ "$answer" == "Y" ]]; then
        mkvirtualenv "$venv"
      fi
    fi
  fi
}
