default[:elephant][:chruby] = {
  :path => '/opt/rubies',
  :rubies => %w[
    2.2.2
    2.0.0-p598
  ],
  :default => '2.2.2',
  :gems => [
    { :name => 'bundler', :version => '~> 1.10.3' },
    { :name => 'bundler-audit', :version => '~> 0.3.1' },
    { :name => 'cheat' },
    { :name => 'explain_shell' },
    { :name => 'haml-lint' },
    { :name => 'mysql2' },
    { :name => 'powder', :version => '~> 0.3.0' },
    { :name => 'pry', :version => '~> 0.10.0' },
    { :name => 'pry-byebug' },
    { :name => 'rubocop', :version => '~> 0.26.1' }
  ]
}
