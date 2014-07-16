default[:elephant][:chruby] = {
  :path => '/usr/local/var/rubies',
  :rubies => %w[
    2.1.1
    2.0.0-p451
    1.8.7-p374
  ],
  :default => '2.1.1',
  :gems => [
    { :name => 'bundler', :version => '~> 1.6.2' },
    { :name => 'bundler-audit', :version => '~> 0.3.1' },
    { :name => 'cheat' },
    { :name => 'explain_shell' },
    { :name => 'mysql2' },
    { :name => 'powder' },
    { :name => 'pry', :version => '~> 0.10.0' },
    { :name => 'pry-byebug' },
    { :name => 'rubocop' }
  ]
}
