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
  ruby -e 'puts "#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}"'
}
