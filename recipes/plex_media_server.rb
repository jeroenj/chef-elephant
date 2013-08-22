dmg_package 'Plex Media Server' do
  source node[:elephant][:plex_media_server][:url]
  checksum node[:elephant][:plex_media_server][:checksum]
  app 'Plex Media Server'
  volumes_dir 'PlexMediaServer'
end
