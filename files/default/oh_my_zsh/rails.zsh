function sc() {
  if [ -e script/rails ]; then
    ruby script/rails console $*
  elif [ -e bin/rails ]; then
    ruby bin/rails console $*
  elif [ -e script/console ]; then
    ruby script/console $*
  else;
    echo "Not in a Rails project"
  fi
}
