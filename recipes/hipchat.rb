# include elephant::settings at the end of the run list to include settings

remote_file "#{Chef::Config[:file_cache_path]}/#{node[:elephant][:hipchat][:file]}" do
  checksum node[:elephant][:hipchat][:checksum]
  source "http://downloads.hipchat.com.s3.amazonaws.com/mac-beta/#{node[:elephant][:hipchat][:file]}"
  not_if { ::File.directory?('/Applications/HipChat.app') }
end

execute 'Install 1Password' do
  command "unzip #{Chef::Config[:file_cache_path]}/#{node[:elephant][:hipchat][:file]}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/HipChat.app') }
end
