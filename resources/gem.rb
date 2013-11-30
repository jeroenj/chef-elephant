actions :install

attribute :name, :kind_of => String, :name_attribute => true
attribute :version, :kind_of => String
attribute :ruby_version, :kind_of => String, :default => node[:elephant][:ruby][:default]

def initialize(name, run_context = nil)
  super
  @action = :install
end
