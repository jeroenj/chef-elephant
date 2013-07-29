# include elephant::settings at the end of the run list to include settings

remote_file "#{Chef::Config[:file_cache_path]}/max_#{node[:elephant][:max][:version]}.zip" do
  checksum node[:elephant][:max][:checksum]
  source node[:elephant][:max][:url]
  not_if { ::File.directory?('/Applications/Max.app') }
end

execute 'Install Alfred' do
  command "tar -jxf #{Chef::Config[:file_cache_path]}/max_#{node[:elephant][:max][:version]}.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Max.app') }
end
