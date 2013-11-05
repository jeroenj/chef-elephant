actions :install

attribute :name, :kind_of => String, :name_attribute => true

def initialize(name, run_context = nil)
  super
  @action = :install
end
