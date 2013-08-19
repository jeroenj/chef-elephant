# include elephant::settings at the end of the run list to include settings

remote_file "#{Chef::Config[:file_cache_path]}/cyberduck_#{node[:elephant][:cyberduck][:version]}.zip" do
  checksum node[:elephant][:cyberduck][:checksum]
  source node[:elephant][:cyberduck][:url]
  not_if { ::File.directory?('/Applications/Cyberduck.app') }
end

execute 'Install Cyberduck' do
  command "unzip #{Chef::Config[:file_cache_path]}/cyberduck_#{node[:elephant][:cyberduck][:version]}.zip"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Cyberduck.app') }
end

node[:elephant][:cyberduck][:bookmarks].each do |bookmark|
  template "#{ENV['HOME']}/Library/Application Support/Cyberduck/Bookmarks/#{bookmark[:nickname]}.duck" do
    source 'cyberduck/bookmark.duck.erb'
    variables({
      hostname: bookmark[:hostname],
      nickname: bookmark[:nickname],
      port: bookmark[:port],
      protocol: bookmark[:protocol],
      username: bookmark[:username]
    })
  end
end