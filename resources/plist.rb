actions :write

attribute :name, :kind_of => String, :name_attribute => true
attribute :content, :kind_of => Hash

def initialize(name, run_context = nil)
  super
  @action = :write
end
