dmg_package 'VLC' do
  source node[:elephant][:vlc][:url]
  checksum node[:elephant][:vlc][:checksum]
  dmg_name "vlc-#{node[:elephant][:vlc][:version]}"
  volumes_dir "vlc-#{node[:elephant][:vlc][:version]}"
end
