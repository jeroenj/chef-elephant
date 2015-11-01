actions :create
default_action :create

attribute :path, kind_of: String, name_attribute: true
attribute :owner, kind_of: String, default: nil
attribute :group, kind_of: String, default: nil
attribute :parent, kind_of: String

def initialize name, run_context = nil
  super
  @parent ||= case path
              when /\/usr\/local\/.*/ then '/usr/local'
              when /#{ENV['HOME']}\/Library\/Application Support\/.*/ then "#{ENV['HOME']}/Library/Application Support"
              when /#{ENV['HOME']}\/Library\/Preferences\/.*/ then "#{ENV['HOME']}/Library/Preferences"
              when /#{ENV['HOME']}\/.*/ then ENV['HOME']
  end
  @parent ||= '/usr' if path =~ /\/usr.*/
end
