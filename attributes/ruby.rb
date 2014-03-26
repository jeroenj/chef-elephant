default[:elephant][:ruby][:gems] = [
  { :name => 'bundler', :version => '~> 1.5.2' },
  { :name => 'bundler-audit', :version => '~> 0.3.0' },
  { :name => 'cheat' },
  { :name => 'colorful_json' },
  { :name => 'explain_shell' },
  { :name => 'gem-open' },
  { :name => 'pry' }
]

default[:elephant][:ruby][:rubocop][:config] = {
  :AccessModifierIndentation => {
    :EnforcedStyle => 'outdent'
  },
  :ClassAndModuleChildren => {
    :Enabled => false
  },
  :Documentation => {
    :Enabled => false
  },
  :LineLength => {
    :Max => 2000
  },
  :MethodDefParentheses => {
    :EnforcedStyle => 'require_no_parentheses'
  }
}
