require 'plist'

action :write do
  file new_resource.name do
    content new_resource.content.to_plist
    notifies :restart, "service[#{new_resource.content[:Label]}]"
  end

  service new_resource.content[:Label]
end
