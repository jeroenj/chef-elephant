default[:elephant][:chruby] = {
  path: '/opt/rubies',
  rubies: %w(
    2.2.3
    2.2.2
    2.1.6
    2.0.0-p647
  ),
  default: '2.2.3',
  gems: [
    { name: 'bundler', version: '~> 1.11.2' },
    { name: 'bundler-audit', version: '~> 0.4.0' },
    { name: 'cheat' },
    { name: 'explain_shell' },
    { name: 'haml-lint' },
    { name: 'mysql2' },
    { name: 'powder', version: '~> 0.3.0' },
    { name: 'pry', version: '~> 0.10.0' },
    { name: 'pry-byebug' },
    { name: 'rubocop', version: '~> 0.26.1' }
  ]
}
