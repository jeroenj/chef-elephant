file = "#{Chef::Config[:file_cache_path]}/plex_media_server_#{node[:elephant][:plex_media_server][:version]}.zip"

remote_file file do
  source node[:elephant][:plex_media_server][:url]
  checksum node[:elephant][:plex_media_server][:checksum]
  not_if { ::File.directory?('/Applications/Plex Media Server.app') }
end

execute 'Install Plex Media Center' do
  command "unzip #{file}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Plex Media Server.app') }
end
