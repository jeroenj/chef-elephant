remote_file "#{Chef::Config[:file_cache_path]}/alfred_#{node['elephant']['alfred']['version']}.zip" do
  checksum node['elephant']['alfred']['checksum']
  source node['elephant']['alfred']['url']
  not_if { ::File.directory?('/Applications/Alfred 2.app') }
end

execute 'Install Alfred' do
  command "unzip #{Chef::Config[:file_cache_path]}/alfred_#{node['elephant']['alfred']['version']}.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Alfred 2.app') }
end

if node['elephant']['alfred']['license']
  directory "#{ENV['HOME']}/Library/Application Support/Alfred 2"

  template "#{ENV['HOME']}/Library/Application Support/Alfred 2/license.plist" do
    source 'alfred/license.plist.erb'
  end
end
