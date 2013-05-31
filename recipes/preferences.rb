include_recipe 'mac_os_x::settings'

execute 'Show library' do
  command 'chflags nohidden ~/Library/'
end
