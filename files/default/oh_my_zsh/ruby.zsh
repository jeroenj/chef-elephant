function update-global-gem() {
  name=$1
  rubies=($(rvm list strings))
  for ruby in $rubies; do
    rvm use $ruby@global
    gem uninstall $name --all --ignore-dependencies --executables
    gem install $name
  done
}

function ruby-version() {
  ruby_string=($(ruby -v))
  if [[ $ruby_string =~ ^ruby\ ([1-2]\.[0-9]\.[0-9](p[0-9]{3})?).*$ ]]; then
    echo $match[1]
  else
    echo $ruby_string
  fi
}
