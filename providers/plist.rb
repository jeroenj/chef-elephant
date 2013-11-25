require 'plist'

action :write do
  restart = new_resource.name =~ /.*\/Library\/Launch(Agents|Daemons)\/.*/

  file new_resource.name do
    content new_resource.content.to_plist
    owner new_resource.owner
    group new_resource.group
    notifies(:restart, "service[#{new_resource.content[:Label]}]") if restart
  end

  service(new_resource.content[:Label]) if restart
end
