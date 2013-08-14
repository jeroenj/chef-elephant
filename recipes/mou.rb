# include elephant::settings at the end of the run list to include settings

remote_file "#{Chef::Config[:file_cache_path]}/Mou.zip" do
  source node[:elephant][:mou][:url]
  not_if { ::File.directory?('/Applications/Mou.app') }
end

execute 'Install Mou' do
  command "unzip #{Chef::Config[:file_cache_path]}/Mou.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Mou.app') }
end
