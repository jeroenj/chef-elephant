file = "#{Chef::Config[:file_cache_path]}/rowmote_helper_#{node[:elephant][:rowmote_helper][:version]}.zip"

remote_file file do
  source node[:elephant][:rowmote_helper][:url]
  checksum node[:elephant][:rowmote_helper][:checksum]
  not_if { ::File.directory?('/Applications/Rowmote Helper.app') }
end

execute 'Install Rowmote Helper' do
  command "unzip #{file}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Rowmote Helper.app') }
end
