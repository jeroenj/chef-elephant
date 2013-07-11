remote_file "#{Chef::Config[:file_cache_path]}/cord_#{node[:elephant][:cord][:version]}.zip" do
  checksum node[:elephant][:cord][:checksum]
  source node[:elephant][:cord][:url]
  not_if { ::File.directory?('/Applications/Cord.app') }
end

execute 'Install Cord' do
  command "unzip #{Chef::Config[:file_cache_path]}/cord_#{node[:elephant][:cord][:version]}.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Cord.app') }
end
