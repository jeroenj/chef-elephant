actions :override

attribute :name, :kind_of => String, :name_attribute => true
attribute :source, :kind_of => String

def initialize(name, run_context = nil)
  super
  @action = :override
end
