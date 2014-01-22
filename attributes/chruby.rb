default[:elephant][:chruby] = {
  :path => '/usr/local/var/rubies',
  :rubies => %w[
    2.1.0
    2.0.0-p353
    1.8.7-p374
  ],
  :default => '2.1.0',
  :gems => [
    { :name => 'bundler', :version => '~> 1.5.1' },
    { :name => 'bundler-audit', :version => '~> 0.3.0' },
    { :name => 'cheat' },
    { :name => 'colorful_json' },
    { :name => 'explain_shell' },
    { :name => 'gem-open' },
    { :name => 'mysql2' },
    { :name => 'powder' },
    { :name => 'pry' },
    { :name => 'zeus' }
  ]
}
