node.default[:mac_os_x][:settings][:'1password'] = node[:elephant][:settings][:'1password']
node.default[:mac_os_x][:settings][:'1password_helper'] = node[:elephant][:settings][:'1password_helper']

include_recipe 'mac_os_x::settings'
