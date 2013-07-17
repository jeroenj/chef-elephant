include_recipe 'mac_os_x::settings'

execute 'Show library' do
  command 'chflags nohidden ~/Library/'
end

if node[:mac_os_x][:settings][:dock]
  execute 'killall Dock'
end

directory "#{ENV['HOME']}/Downloads/About Downloads.lpdf" do
  recursive true
  action :delete
end
