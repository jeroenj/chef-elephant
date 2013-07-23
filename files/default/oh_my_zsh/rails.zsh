function sc() {
  if [ -e script/rails ]; then
    if [ -e .zeus.sock ]; then
      zeus console
    else;
      ruby script/rails console $*
    fi
  elif [ -e bin/rails ]; then
    if [ -e .zeus.sock ]; then
      zeus console
    else;
      ruby bin/rails console $*
    fi
  elif [ -e script/console ]; then
    ruby script/console $*
  else;
    echo "Not in a Rails project"
  fi
}
