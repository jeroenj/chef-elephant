include_recipe 'mac_os_x::settings'

execute 'Show library' do
  command 'chflags nohidden ~/Library/'
end

if default[:mac_os_x][:settings][:dock]
  execute 'killall Dock'
end
