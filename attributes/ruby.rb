default[:elephant][:ruby][:gems] = [
  { :name => 'bundler', :version => '~> 1.6.2' },
  { :name => 'bundler-audit', :version => '~> 0.3.1' },
  { :name => 'cheat' },
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
