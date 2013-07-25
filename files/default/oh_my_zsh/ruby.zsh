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

function fast-rspec() {
  args=$1
  if [ -e .zeus.sock ]; then
    zeus rspec $args
  else;
    if [ -e .zeus.sock ]; then
      bundle exec rspec $args
    else;
      rspec $args
    fi
  fi
}
