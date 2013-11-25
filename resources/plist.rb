actions :write

attribute :name, :kind_of => String, :name_attribute => true
attribute :content, :kind_of => Hash
attribute :owner, :kind_of => String, :default => nil
attribute :group, :kind_of => String, :default => nil

def initialize(name, run_context = nil)
  super
  @action = :write
end
