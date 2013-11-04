default[:elephant][:ruby] = {
  :path => '/usr/local/var/rubies',
  :rubies => %w[
    2.0.0-p247
    1.9.3-p448
    1.8.7-p374
  ],
  :default => '2.0.0',
  :gems => {
    'bundler' => nil,
    'bundler-audit' => '0.3.0',
    'cheat' => nil,
    'colorful_json' => nil,
    'explain_shell' => nil,
    'gem-open' => nil,
    'mysql2' => nil,
    'powder' => nil,
    'pry' => nil,
    'zeus' => nil
  }
}
