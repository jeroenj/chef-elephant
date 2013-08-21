file = "#{Chef::Config[:file_cache_path]}/plex_media_center_#{node[:elephant][:plex_media_center][:version]}.zip"

remote_file file do
  source node[:elephant][:plex_media_center][:url]
  checksum node[:elephant][:plex_media_center][:checksum]
  not_if { ::File.directory?('/Applications/Plex.app') }
end

execute 'Install Plex Media Center' do
  command "unzip #{file}"
  cwd '/Applications'
  not_if { ::File.directory?('/Applications/Plex.app') }
end
