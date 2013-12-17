actions :create

attribute :path, :kind_of => String, :name_attribute => true
attribute :owner, :kind_of => String, :default => nil
attribute :group, :kind_of => String, :default => nil
attribute :parent, :kind_of => String

def initialize(name, run_context = nil)
  super
  @parent ||= '/usr' if path =~ /\/usr.*/
  @action = :create
end
