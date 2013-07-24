dmg_package 'Charles' do
  source node[:elephant][:charles][:url]
  checksum node[:elephant][:charles][:checksum]
  volumes_dir "Charles Proxy v#{node[:elephant][:charles][:version]}"
  accept_eula true
end
