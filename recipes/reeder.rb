node.default[:mac_os_x][:settings][:reeder] = node[:elephant][:settings][:reeder]

include_recipe 'mac_os_x::settings'
