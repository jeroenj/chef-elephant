function symlink-logs () {
  rm -rf log
  dir=~/Library/Logs/rails/${PWD##*/}
  mkdir -p $dir
  ln -s $dir log
  echo "Symlinked log to $dir"
}
