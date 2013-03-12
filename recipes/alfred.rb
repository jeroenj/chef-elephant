remote_file "#{Chef::Config[:file_cache_path]}/alfred_#{node['elephant']['alfred']['version']}.zip" do
  checksum node['elephant']['alfred']['checksum']
  source "http://cachefly.alfredapp.com/alfred_#{node['elephant']['alfred']['version']}.zip"
  not_if { ::File.directory?('/Applications/Alfred.app') }
end

execute 'Install Alfred' do
  command "unzip #{Chef::Config[:file_cache_path]}/alfred_#{node['elephant']['alfred']['version']}.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Alfred.app') }
end

cookbook_file "#{ENV['HOME']}/Library/Application Support/Alfred/customsites/customsites.plist" do
  source 'alfred/customsites.plist'
  owner node['elephant']['user']
end

directory "#{ENV['HOME']}/Library/Application Support/Alfred/extensions/applescripts/Open Safari url in Chrome" do
  owner node['elephant']['user']
end

cookbook_file "#{ENV['HOME']}/Library/Application Support/Alfred/extensions/applescripts/Open Safari url in Chrome/info.plist" do
  source 'alfred/extensions/applescripts/open_safari_url_in_chrome/info.plist'
  owner node['elephant']['user']
end

cookbook_file "#{ENV['HOME']}/Library/Application Support/Alfred/extensions/applescripts/Open Safari url in Chrome/kudos.plist" do
  source 'alfred/extensions/applescripts/open_safari_url_in_chrome/kudos.plist'
  owner node['elephant']['user']
end

if node['elephant']['alfred']['license']
  template "#{ENV['HOME']}/Library/Application Support/Alfred/license.plist" do
    source 'alfred/license.plist.erb'
    owner node['elephant']['user']
  end
end
