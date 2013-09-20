# include elephant::settings at the end of the run list to include settings

remote_file "#{Chef::Config[:file_cache_path]}/hipchat_#{node[:elephant][:hipchat][:version]}.zip" do
  checksum node[:elephant][:hipchat][:checksum]
  source node[:elephant][:hipchat][:url]
  not_if { ::File.directory?('/Applications/HipChat.app') }
end

execute 'Install Hipchat' do
  command "unzip #{Chef::Config[:file_cache_path]}/hipchat_#{node[:elephant][:hipchat][:version]}.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/HipChat.app') }
end
