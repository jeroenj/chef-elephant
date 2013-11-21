require 'plist'

action :write do
  restart = new_resource.name =~ /\/Users\/\w+\/Library\/Launch(Agents|Daemons)\/.*/

  file new_resource.name do
    content new_resource.content.to_plist
    notifies(:restart, "service[#{new_resource.content[:Label]}]") if restart
  end

  service(new_resource.content[:Label]) if restart
end
