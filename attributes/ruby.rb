default[:elephant][:ruby] = {
  :path => '/usr/local/var/rubies',
  :rubies => %w[
    2.0.0-p247
    1.9.3-p448
    1.8.7-p374
  ],
  :default => '2.0.0',
  :gems => %w[
    bundler
    bundler-audit
    cheat
    colorful_json
    explain_shell
    gem-open
    mysql2
    powder
    pry
    zeus
  ]
}
