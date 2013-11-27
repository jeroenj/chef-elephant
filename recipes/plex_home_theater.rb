file = "#{Chef::Config[:file_cache_path]}/plex_home_theater_#{node[:elephant][:plex_home_theater][:version]}.zip"

remote_file file do
  source node[:elephant][:plex_home_theater][:url]
  checksum node[:elephant][:plex_home_theater][:checksum]
  not_if { ::File.directory?('/Applications/Plex Home Theater.app') }
end

execute 'Install Plex Home Theater' do
  command "unzip #{file}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Plex Home Theater.app') }
end

directory "#{ENV['HOME']}/Library/Application Support/Plex Home Theater/userdata" do
  recursive true
  owner node[:elephant][:username]
  group node[:elephant][:group]
end

template "#{ENV['HOME']}/Library/Application Support/Plex Home theater/userdata/guisettings.xml" do
  source 'plex_home_theater/guisettings.xml.erb'
  variables(
    :device_name => node[:elephant][:hostname],
    :lastfm_encrypted_password => node[:elephant][:plex_home_theater][:preferences][:lastfm_encrypted_password],
    :lastfm_username => node[:elephant][:plex_home_theater][:preferences][:lastfm_username],
    :myplex_token => node[:elephant][:plex_home_theater][:preferences][:myplex_token],
    :myplex_username => node[:elephant][:plex_home_theater][:preferences][:myplex_username],
    :version => node[:elephant][:plex_home_theater][:version]
  )
  owner node[:elephant][:username]
  group node[:elephant][:group]
end
