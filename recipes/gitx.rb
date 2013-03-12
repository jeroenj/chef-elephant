remote_file "#{Chef::Config[:file_cache_path]}/GitX-L_v0.8.4.zip" do
  checksum 'c5f4088497abf5a219bb7bde4fae643fec61647be25bf836fd679567dcabd7df'
  source 'https://github.com/downloads/laullon/gitx/GitX-L_v0.8.4.zip'
  not_if { ::File.directory?('/Applications/GitX.app') }
end

execute 'Install GitX' do
  command "unzip #{Chef::Config[:file_cache_path]}/GitX-L_v0.8.4.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/GitX.app') }
end
